import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { create, getNumericDate } from 'https://deno.land/x/djwt@v3.0.2/mod.ts'

function pemToArrayBuffer(pem: string): ArrayBuffer {
  const base64 = pem
    .replace(/-----BEGIN PRIVATE KEY-----/, '')
    .replace(/-----END PRIVATE KEY-----/, '')
    .replace(/\n/g, '')
  const binary = atob(base64)
  const buffer = new ArrayBuffer(binary.length)
  const view = new Uint8Array(buffer)
  for (let i = 0; i < binary.length; i++) {
    view[i] = binary.charCodeAt(i)
  }
  return buffer
}

async function getAccessToken(serviceAccount: any): Promise<string> {
  const key = await crypto.subtle.importKey(
    'pkcs8',
    pemToArrayBuffer(serviceAccount.private_key),
    { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' },
    false,
    ['sign'],
  )

  const jwt = await create(
    { alg: 'RS256', typ: 'JWT' },
    {
      iss: serviceAccount.client_email,
      scope: 'https://www.googleapis.com/auth/firebase.messaging',
      aud: 'https://oauth2.googleapis.com/token',
      exp: getNumericDate(3600),
      iat: getNumericDate(0),
    },
    key,
  )

  const response = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: `grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=${jwt}`,
  })

  const data = await response.json()
  return data.access_token
}

serve(async () => {
  try {
    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!,
    )

    const serviceAccount = JSON.parse(Deno.env.get('FIREBASE_SERVICE_ACCOUNT')!)
    const accessToken = await getAccessToken(serviceAccount)
    const projectId = serviceAccount.project_id

    const today = new Date()
    today.setHours(0, 0, 0, 0)

    const dDay7 = new Date(today)
    dDay7.setDate(dDay7.getDate() + 7)

    const { data: projects, error } = await supabase
      .from('project')
      .select('title, deadline, user_id, user(fcm_token, notify_deadline, locale)')
      .eq('status', 'in_progress')

    if (error) throw error

    if (!projects || projects.length === 0) {
      return new Response('No projects', { status: 200 })
    }

    for (const project of projects) {
      const token = project.user?.fcm_token
      const notify = project.user?.notify_deadline
      if (!token || !notify) continue

      const deadline = new Date(project.deadline)
      deadline.setHours(0, 0, 0, 0)

      const isToday = deadline.getTime() === today.getTime()
      const isD7 = deadline.getTime() === dDay7.getTime()

      if (!isToday && !isD7) continue

      const isKo = project.user?.locale === 'ko'
      const title = isToday
        ? (isKo ? '📅 마감일 알림' : '📅 Deadline Alert')
        : (isKo ? '⏰ 마감일이 다가오고 있어요' : '⏰ Deadline Coming Up')
      const body = isToday
        ? (isKo ? `${project.title} 마감일이 오늘이에요!` : `${project.title} is due today!`)
        : (isKo ? `${project.title} 마감일까지 7일 남았어요!` : `${project.title} is due in 7 days!`)

      const fcmResponse = await fetch(
        `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${accessToken}`,
          },
          body: JSON.stringify({
            message: {
              token,
              notification: { title, body },
            },
          }),
        }
      )

      const fcmResult = await fcmResponse.json()
      if (fcmResult.error) {
        console.error('FCM 에러:', JSON.stringify(fcmResult.error))
      }
    }

    return new Response('Done', { status: 200 })

  } catch (e) {
    console.error('에러 발생:', e)
    return new Response('Error', { status: 500 })
  }
})
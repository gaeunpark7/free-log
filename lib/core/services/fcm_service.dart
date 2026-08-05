import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FcmService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final SupabaseClient _supabase;

  FcmService(this._supabase);
  Future<void> initialize() async {
    final locale = Platform.localeName.split('_')[0];
    debugPrint('기기 언어: $locale');

    final settings = await _messaging.requestPermission(alert: true, badge: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final token = await _messaging.getToken();
      if (token != null) {
        await _saveToken(token, locale);
        _messaging.onTokenRefresh.listen((t) => _saveToken(t, locale));
      }
    }

    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('포그라운드 알림: ${message.notification?.title}');
    });
  }

  Future<void> _saveToken(String token, String locale) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    final response = await _supabase
        .from('user')
        .select('fcm_token, locale')
        .eq('id', userId)
        .single();

    final currentToken = response['fcm_token'];
    final currentLocale = response['locale'];

    // 다를 때만 저장
    if (currentToken == token && currentLocale == locale) {
      debugPrint('FCM 토큰 동일: 저장 생략');
      return;
    }

    await _supabase.from('user').update({'fcm_token': token, 'locale': locale}).eq('id', userId);

    debugPrint('FCM 토큰 + locale 저장 완료: $locale');
  }
}

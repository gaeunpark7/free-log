import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Free Log',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              _buildLoginButton(Color(0xffFEE500), 'Login with Kakao'),
              _buildLoginButton(Color(0xfff2f2f2), 'Sign in with Google'),
            ],
          ),
        ),
      ),
    );
  }

  FilledButton _buildLoginButton(
    Color color,
    String text, {
    VoidCallback? onPressed,
  }) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed ?? () {},
      child: Text(text, style: TextStyle(color: Colors.black)),
    );
  }
}

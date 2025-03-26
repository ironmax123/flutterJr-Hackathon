import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:room_check/feature/login/widgets/card.dart';
import 'package:room_check/primary/utils/gradient_style.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: GradientStyle.pinkGradient,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              /// ログインフォームのカード
              child: LoginPageCard(),
            ),
          ],
        ),
      ),
    );
  }
}

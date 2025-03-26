import 'package:flutter/material.dart';
import 'package:room_check/feature/sign_up/widgets/arrow_back.dart';
import 'package:room_check/feature/sign_up/widgets/card.dart';
import 'package:room_check/primary/utils/gradient_style.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: GradientStyle.pinkGradient,
        ),
        child: const Stack(
          children: [
            /// 左上に戻るボタン配置
            SignupPageArrowBackButton(),

            /// 中央にカードを配置
            Center(child: SingUpPageCard()),
          ],
        ),
      ),
    );
  }
}

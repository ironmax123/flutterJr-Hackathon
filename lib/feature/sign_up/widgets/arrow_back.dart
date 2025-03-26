import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/primary/utils/color.dart';

class SignupPageArrowBackButton extends StatelessWidget {
  const SignupPageArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 20,
      child: IconButton(
        onPressed: () => context.pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColor.primaryWhite,
          size: 32,
        ),
      ),
    );
  }
}

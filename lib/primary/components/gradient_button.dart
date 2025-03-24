import 'package:flutter/material.dart';
import 'package:room_check/primary/utils/color.dart';

class PrimaryGradientButton extends StatelessWidget {
  final Color outlineColor;
  final Gradient gradient;
  final String text;
  final VoidCallback? onPressed;
  const PrimaryGradientButton({
    super.key,
    required this.outlineColor,
    required this.gradient,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: outlineColor,
          width: 2,
        ),
        padding: EdgeInsets.zero,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 50,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColor.primaryWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

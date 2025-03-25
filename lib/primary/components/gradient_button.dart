import 'package:flutter/material.dart';
import 'package:room_check/primary/utils/color.dart';

/// グラデーションボタン
/// [outlineColor]外側の線の色
/// [gradient]グラデーションの色
/// [text]ボタンのテキスト
/// [onPressed]ボタンを押した時の処理
///
/// 使い方:
///
/// ```dart
/// PrimaryGradientButton(
///   outlineColor: AppColor.primaryBlack,
///   gradient: GradientStyle.blueGradient,
///   text: 'Press Me',
///   onPressed: () {
///     print('Button Pressed');
///   },
/// )
/// ```
///
class PrimaryGradientButton extends StatelessWidget {
  final Color outlineColor;
  final Gradient gradient;
  final String text;
  final VoidCallback? onPressed;
  final double fontSize;
  final double horizontal;
  const PrimaryGradientButton({
    super.key,
    required this.outlineColor,
    required this.gradient,
    required this.text,
    this.fontSize = 24,
    this.horizontal = 50,
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
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: horizontal,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.primaryWhite,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GradientStyle {
  /// ログイン画面等で使用するグラデーション
  static const pinkGradient = LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      Color(0xffFF9395),
      Color(0xff8861C1),
    ],
  );

  /// 主にボタンで使用するグラデーション
  static const blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF61BDCE),
      Color(0xFF8861C1),
    ],
  );
}

const double kDefaultPadding = 16;

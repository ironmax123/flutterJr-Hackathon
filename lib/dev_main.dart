import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/login/page.dart';
import 'package:room_check/feature/posts/view.dart';
import 'package:room_check/feature/sign_up/page.dart'
import 'package:room_check/feature/invitation/view.dart';

import 'package:room_check/main.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:camera/camera.dart';

/// flutter run --target lib/dev_main.dart
Future<void> main() async {
  await mainCommonMethod();
  // デバイスで使用可能なカメラのリストを取得
  //final cameras = await availableCameras();

  // // 利用可能なカメラのリストから特定のカメラを取得
  // final firstCamera = cameras.first;
  runApp(
    const ProviderScope(
        child: MyApp(
            //camera: cameras,
            )),
  );
}

class MyApp extends StatelessWidget {
  //final List<CameraDescription> camera;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.primaryWhite,
      ),
      home: const LoginPage(),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/home/view.dart';
import 'package:room_check/feature/invitation/view.dart';
import 'package:room_check/main.dart';
import 'package:room_check/primary/utils/color.dart';

/// flutter run --target lib/dev_main.dart
Future<void> main() async {
  await mainCommonMethod();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.primaryWhite,
      ),
      home: const InvationScreen(),
    );
  }
}

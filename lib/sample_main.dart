import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/sample/view.dart';
import 'package:room_check/main.dart';

/// flutter run --target lib/sample_main.dart
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
      ),
      home: const SampleScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/routers/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await mainCommonMethod();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

Future<void> mainCommonMethod() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  final String url = dotenv.env['URL']!;
  final String anonkey = dotenv.env['ANON_KEY']!;

  await Supabase.initialize(
    url: url,
    anonKey: anonkey,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

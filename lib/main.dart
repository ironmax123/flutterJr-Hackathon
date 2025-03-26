import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/home/view.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/routers/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await mainCommonMethod();
  final cameras = await availableCameras();
  runApp(
    ProviderScope(child: MyApp(camera: cameras)),
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
  final List<CameraDescription> camera;
  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.primaryWhite,
      ),
      builder: (context, child) {
        return HomeScreen(cameras: camera);
      },
    );
  }
}

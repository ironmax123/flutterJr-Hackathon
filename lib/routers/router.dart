import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/feature/home/view.dart';
import 'package:room_check/feature/invitation/scan/page.dart';
import 'package:room_check/feature/invitation/view.dart';
import 'package:room_check/feature/login/page.dart';
import 'package:room_check/feature/login_check.dart';
import 'package:room_check/feature/sign_up/page.dart';

GoRouter goRouter(List<CameraDescription> cameras) {
  return GoRouter(
    initialLocation: '/feature', // Set a valid initial location
    routes: [
      GoRoute(
        path: '/feature',
        name: 'LoginCheckPage',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const LoginCheckPage(),
          );
        },
      ),
      GoRoute(
        path: '/login',
        name: 'LoginScreen',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: '/sing_up',
        name: 'SignupScreen',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const SignupPage(),
          );
        },
      ),
      GoRoute(
        path: '/home',
        name: 'Home',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: HomeScreen(
              cameras: cameras,
            ),
          );
        },
      ),
      GoRoute(
        path: '/invitation',
        name: 'invitation',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const InvitationScreen(),
          );
        },
        routes: [
          // 子ルートとして/scanを追加
          GoRoute(
            path: 'scan',
            name: 'qrscan',
            pageBuilder: (context, state) {
              return MaterialPage(
                key: state.pageKey,
                child: const QRcodeScanPage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}

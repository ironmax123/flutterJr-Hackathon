import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/feature/home/view.dart';
import 'package:room_check/feature/invitation/view.dart';

GoRouter goRouter(List<CameraDescription> cameras) {
  return GoRouter(
    initialLocation: '/home', // Set a valid initial location
    routes: [
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
      ),
    ],
  );
}

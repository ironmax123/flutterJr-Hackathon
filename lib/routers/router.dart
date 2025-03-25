import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/feature/home/view.dart';

final goRouter = GoRouter(
  initialLocation: '/features',
  routes: [
    GoRoute(
      path: '/features',
      name: 'Home',
      pageBuilder: (context, state) {
        final data = state.extra;
        return MaterialPage(
          key: state.pageKey,
          child: HomeScreen(
            cameras: data as List<CameraDescription>,
          ),
        );
      },
    ),
  ],
);

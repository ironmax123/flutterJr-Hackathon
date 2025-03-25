import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPre extends StatelessWidget {
  final CameraController controller;
  final Future<void> initializeControllerFuture;
  const CameraPre({
    super.key,
    required this.controller,
    required this.initializeControllerFuture,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(controller);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

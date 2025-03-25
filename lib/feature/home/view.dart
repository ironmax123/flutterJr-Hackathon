// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:room_check/feature/home/components/buttons.dart';
import 'package:room_check/feature/home/components/limit.dart';
import 'package:room_check/primary/components/user_icon.dart';
import 'package:room_check/test/camera/widgets/camera_preview.dart';

class HomeScreen extends HookWidget {
  final List<CameraDescription> cameras;
  const HomeScreen({
    super.key,
    required this.cameras,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = useState<String?>(null);
    final _controller = useState<CameraController?>(null);
    var image = useState<XFile?>(null);
    final _initializeControllerFuture = useState<Future<void>?>(null);

    void cameraValue(int i) async {
      await _controller.value?.dispose();
      _controller.value = CameraController(
        // カメラを指定
        cameras[i],
        // 解像度を定義
        ResolutionPreset.medium,
      );
      // コントローラーを初期化
      _initializeControllerFuture.value = _controller.value!.initialize();

      // await _controller.value!.initialize();
      // await _controller.value!.setZoomLevel(i.toDouble());
    }

    useEffect(() {
      cameraValue(0);
      return null;
    }, []);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryUserIcon(
                    imageUrl: 'null',
                    onTap: () {},
                    width: 64,
                    heigt: 64,
                  ),
                ),
              ),
              HomeScreenLimit(limitTime: ValueNotifier(60)),
              const Gap(50),
              (imagePath.value != null)
                  ? Image.file(File(imagePath.value!))
                  : (_controller.value != null &&
                          _initializeControllerFuture.value != null)
                      ? CameraPre(
                          controller: _controller.value!,
                          initializeControllerFuture:
                              _initializeControllerFuture.value!,
                        )
                      : Container(),
              const Gap(48),
              const HomeScreenButtons(),
            ],
          )
        ],
      ),
    );
  }
}

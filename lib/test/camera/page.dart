// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:room_check/test/camera/widgets/camera_preview.dart';

class CameraTestPage extends HookWidget {
  final List<CameraDescription> cameras;
  const CameraTestPage({
    super.key,
    required this.cameras,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = useState<String?>(null);
    final _controller = useState<CameraController?>(null);
    var image = useState<XFile?>(null);
    final _initializeControllerFuture = useState<Future<void>?>(null);

    void cameraValue(int i) {
      _controller.value = CameraController(
        // カメラを指定
        cameras[i],
        // 解像度を定義
        ResolutionPreset.medium,
      );

      // コントローラーを初期化
      _initializeControllerFuture.value = _controller.value!.initialize();
    }

    useEffect(() {
      cameraValue(0);
      return null;
    }, []);

    return Scaffold(
        appBar: AppBar(title: const Text('カメラ切り替えテスト')),
        body: Column(
          children: [
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
            const Gap(16),
            ElevatedButton(
                onPressed: () {
                  cameraValue(1);
                },
                child: const Text('1に切り替え')),
            const Gap(16),
            ElevatedButton(
              onPressed: () async {
                if (_controller.value != null) {
                  image.value = await _controller.value!.takePicture();
                  imagePath.value = image.value?.path;
                }
              },
              child: const Text('写真を撮る'),
            ),
          ],
        ));
  }
}

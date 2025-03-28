import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:room_check/feature/home/components/audio.dart';
import 'package:room_check/feature/home/vm.dart';
import 'package:room_check/gen/assets.gen.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/repository/post/repository.dart';

class HomeScreenLimit extends HookConsumerWidget {
  final ValueNotifier<bool> isStart;
  final ValueNotifier totalTime;
  final ValueNotifier image;
  final ValueNotifier imagePath;
  final ValueNotifier controller;
  const HomeScreenLimit({
    super.key,
    required this.isStart,
    required this.totalTime,
    required this.image,
    required this.imagePath,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limitTime = useState<double>(1.0); // 進捗を1.0(100%)からスタート
    final imageUrl = useState<String?>(null);
    final player = useMemoized(() => AudioPlayer());
    final player2 = useMemoized(() => AudioPlayer());

    Future<void> upLoad() async {
      imageUrl.value =
          await ref.read(postRepoProvider).uploadImage(imagePath.value);
      log('画像:${imageUrl.value}');

      ref.read(homeScreenVMProvider.notifier).createPost(imageUrl.value);
    }

    useEffect(() {
      Timer? timer;
      if (isStart.value && totalTime.value > 0) {
        final path = Assets.audio.limitTime;
        playLoopSound(player, path);
        final limit10 = Assets.audio.limit10m;
        playSound(player2, limit10);
        timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
          if (limitTime.value > 0) {
            limitTime.value -= 1 / totalTime.value;
            final remainingTime = (limitTime.value * totalTime.value).ceil();
            if (remainingTime == 300) {
              final path1 = Assets.audio.limit5;
              playSound(player2, path1);
            }
            if (remainingTime == 180) {
              final path1 = Assets.audio.limit3;
              playSound(player2, path1);
            }
            if (remainingTime == 60) {
              final path1 = Assets.audio.limit1;
              playSound(player2, path1);
            }
            if (remainingTime == 30) {
              final path1 = Assets.audio.limit30;
              playSound(player2, path1);
            }
            if (remainingTime == 10) {
              final path1 = Assets.audio.limit10s;
              playSound(player2, path1);
            }
          } else {
            await Future.microtask(() async {
              if (controller.value != null) {
                image.value = await controller.value!.takePicture();
                imagePath.value = image.value?.path;
              }
            });
            player.stop();
            final path = Assets.audio.shutter;
            await playSound(player2, path);
            timer.cancel();
            await upLoad();
          }
        });
      }

      return () => timer?.cancel();
    }, [isStart.value]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '残り',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryBlack,
              ),
            ),
          ),
          Text(
            '${(limitTime.value * totalTime.value).ceil()} 秒',
            style: const TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryBlack,
            ),
          ),
          TimerCircle(
            progressNotifier: limitTime,
            totalTime: totalTime.value,
          ),
        ],
      ),
    );
  }
}

class TimerCircle extends StatelessWidget {
  final int totalTime;
  final ValueNotifier<double> progressNotifier;

  const TimerCircle({
    super.key,
    required this.totalTime,
    required this.progressNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: progressNotifier,
      builder: (context, progress, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // グレー背景
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: 1,
                strokeWidth: 12,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade300),
              ),
            ),
            // 青い進捗バー
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: Colors.transparent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}

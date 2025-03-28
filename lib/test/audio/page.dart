import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_audio/just_audio.dart';
import 'package:room_check/gen/assets.gen.dart';
import 'package:room_check/test/audio/audio.dart';

class AudioTestPage extends HookWidget {
  const AudioTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final player = useMemoized(() => AudioPlayer());
    return Scaffold(
      appBar: AppBar(title: const Text('音声再生ページ')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(width: double.infinity),
          const Text('残り時間', style: TextStyle(fontSize: 20)),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limit10m;
                playSound(player, path);
              },
              child: const Text('10分')),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limit5;
                playSound(player, path);
              },
              child: const Text('5分')),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limit3;
                playSound(player, path);
              },
              child: const Text('3分')),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limit1;
                playSound(player, path);
              },
              child: const Text('1分')),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limit30;
                playSound(player, path);
              },
              child: const Text('30秒')),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limit10s;
                playSound(player, path);
              },
              child: const Text('10秒')),
          const Divider(),
          const Text('その他', style: TextStyle(fontSize: 20)),
          ElevatedButton(
              onPressed: () {
                final path = Assets.audio.limitTime;
                playSound(player, path);
              },
              child: const Text('制限時間音')),
        ]),
      ),
    );
  }
}

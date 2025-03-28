import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

Future<void> playSound(player, path) async {
  try {
    await player.setAsset(path);
    debugPrint('音声ファイルロード完了');
    player.play();
  } catch (e) {
    debugPrint('Error: $e');
  }
}

Future<void> playLoopSound(player, path) async {
  try {
    await player.setAsset(path);
    player.play();
    player.setLoopMode(LoopMode.one);
  } catch (e) {
    debugPrint('Error: $e');
  }
}

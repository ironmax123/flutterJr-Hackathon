import 'package:flutter/widgets.dart';

Future<void> playSound(player, path) async {
  try {
    await player.setAsset(path);
    debugPrint('音声ファイルロード完了');
    player.play();
  } catch (e) {
    debugPrint('Error: $e');
  }
}

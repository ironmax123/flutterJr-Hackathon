import 'dart:developer';

import 'package:room_check/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> signUp(
  String email,
  String password,
  String userName,
  String? imageUrl,
) async {
  try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'username': userName,
        'avatar_url': imageUrl,
      },
    );
    final userInfo = response.user;
    final uid = userInfo?.id;
    await supabase.from('friend').insert({
      'id': uid.toString(),
    }).select();
  } on AuthException catch (error) {
    log('エラー：$error');
    return;
  } on Exception catch (e) {
    log('エラー：$e');
    return;
  }
}

Future<String?> uploadImage(selectedImage) async {
  if (selectedImage == null) return null;

  try {
    final fileBytes = await selectedImage!.readAsBytes(); // バイナリデータに変換
    final fileName =
        'avatar/${DateTime.now().toIso8601String()}.png'; // ファイル名をユニークに

    await supabase.storage.from('avatar').uploadBinary(fileName, fileBytes);

    log('画像アップロード成功！');
    final imageUrl = supabase.storage.from('avatar').getPublicUrl(fileName);
    return imageUrl;
  } catch (error) {
    log('アップロードエラー: $error');
  }
  return null;
}

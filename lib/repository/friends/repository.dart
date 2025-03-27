import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/friend/entity.dart';
import 'package:room_check/service/friends/service.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:uuid/uuid.dart';

part 'repository.g.dart';

@riverpod
FriendRepo friendRepo(Ref ref) => FriendRepo(
      ref: ref,
      friendService: ref.read(friendServiceProvider),
    );

/// キャッシュするためのProvider
@Riverpod(keepAlive: true)
class PostRepoCashe extends _$PostRepoCashe {
  @override
  Map<String, FriendEntity> build() => {};
  void update(String id, FriendEntity friend) {
    if (state[id] != friend) {
      state = {...state, id: friend};
    }
  }
}

class FriendRepo {
  FriendRepo({
    required Ref ref,
    required FriendService friendService,
  })  : _ref = ref,
        _friendService = friendService;

  final Ref _ref;
  final FriendService _friendService;

  /// create(作成メソッド)VMから[PostEntity]を受け取って投稿を作成する
  Future<void> addUsers(userId) async {
    await _friendService.update(userId);
    log('れぽ：ユーザーが更新されました');
  }

  Future<String> generatePostId() async {
    var uuid = const Uuid();
    return uuid.v4();
  }

  Future<String?> uploadImage(selectedImage) async {
    if (selectedImage == null) return null;

    try {
      final file = File(selectedImage);
      final fileBytes = await file.readAsBytes(); // バイナリデータに変換
      final fileName =
          'uploads/${DateTime.now().toIso8601String()}.png'; // ファイル名をユニークに

      await supabase.storage.from('sample').uploadBinary(fileName, fileBytes);

      log('画像アップロード成功！');
      final imageUrl = supabase.storage.from('sample').getPublicUrl(fileName);
      return imageUrl;
    } catch (error) {
      log('アップロードエラー: $error');
    }
    return null;
  }
}

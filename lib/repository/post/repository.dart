import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/service/post/service.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:uuid/uuid.dart';

part 'repository.g.dart';

@riverpod
PostRepo postRepo(Ref ref) => PostRepo(
      ref: ref,
      postService: ref.read(postServiceProvider),
    );

/// キャッシュするためのProvider
@Riverpod(keepAlive: true)
class PostRepoCashe extends _$PostRepoCashe {
  @override
  Map<String, PostEntity> build() => {};
  void update(String id, PostEntity post) {
    if (state[id] != post) {
      state = {...state, id: post};
    }
  }
}

/// 投稿のリポジトリ
class PostRepo {
  PostRepo({
    required Ref ref,
    required PostService postService,
  })  : _ref = ref,
        _postService = postService;

  final Ref _ref;
  final PostService _postService;

  /// read(読み取るメソッド)[postId]で投稿のキャッシュを探索できる
  Future<Result<List<PostEntity>>> readPosts(
      {bool shouldRefresh = false, String? postId}) async {
    final cacheData = _ref.read(postRepoCasheProvider)[postId];
    final useCache = !shouldRefresh && cacheData != null;
    if (useCache) {
      return Result.ok([cacheData]);
    }
    final result = await _postService.read();
    // final socket = await _postService.socket();

    switch (result) {
      case Ok(:final value):
        for (var post in value) {
          _ref.read(postRepoCasheProvider.notifier).update(post.postId, post);
        }
        return Result.ok(value);
      case Error():
        return Result.error(result.error);
    }
  }

  /// create(作成メソッド)VMから[PostEntity]を受け取って投稿を作成する
  Future<Result<List<PostEntity>>> createPost(PostEntity post) async {
    final result = await _postService.insert(
      PostEntity(
        postId: post.postId,
        userId: post.userId,
        imageUrl: post.imageUrl,
      ),
    );

    switch (result) {
      case Ok(:final value):
        _ref.read(postRepoCasheProvider.notifier).update(post.postId, post);
        return Result.ok(value);
      case Error():
        return Result.error(result.error);
    }
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

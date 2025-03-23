import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/sample/entity.dart';
import 'package:room_check/service/sample/service.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:uuid/uuid.dart';

part 'repository.g.dart';

@riverpod
SampleRepo sampleRepo(Ref ref) => SampleRepo(
      ref: ref,
      sampleService: ref.read(sampleServiceProvider),
    );

/// キャッシュするためのProvider
@Riverpod(keepAlive: true)
class PostRepoCashe extends _$PostRepoCashe {
  @override
  Map<String, SampleEntity> build() => {};
  void update(String id, SampleEntity post) {
    if (state[id] != post) {
      state = {...state, id: post};
    }
  }
}

/// 投稿のリポジトリ
class SampleRepo {
  SampleRepo({
    required Ref ref,
    required SampleService sampleService,
  })  : _ref = ref,
        _sampleService = sampleService;

  final Ref _ref;
  final SampleService _sampleService;

  /// read(読み取るメソッド)[postId]で投稿のキャッシュを探索できる
  Future<Result<List<SampleEntity>>> readPosts(
      {bool shouldRefresh = false, String? postId}) async {
    final cacheData = _ref.read(postRepoCasheProvider)[postId];
    final useCache = !shouldRefresh && cacheData != null;
    if (useCache) {
      return Result.ok([cacheData]);
    }
    final result = await _sampleService.read();
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

  /// create(作成メソッド)VMから[SampleEntity]を受け取って投稿を作成する
  Future<Result<List<SampleEntity>>> createPost(SampleEntity post) async {
    final result = await _sampleService.insert(
      SampleEntity(
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
      final fileBytes = await selectedImage!.readAsBytes(); // バイナリデータに変換
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

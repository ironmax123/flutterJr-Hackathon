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
class FriendRepoCashe extends _$FriendRepoCashe {
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

  Future<Result<List<FriendEntity>>> readFriend(
      {bool shouldRefresh = false, String? postId}) async {
    final cacheData = _ref.read(friendRepoCasheProvider)[postId];
    final useCache = !shouldRefresh && cacheData != null;
    if (useCache) {
      return Result.ok([cacheData]);
    }
    final result = await _friendService.read();
    // final socket = await _postService.socket();

    switch (result) {
      case Ok(:final value):
        for (var post in value) {
          _ref.read(friendRepoCasheProvider.notifier).update(post.id, post);
        }
        return Result.ok(value);
      case Error():
        return Result.error(result.error);
    }
  }

  Future<void> addUsers(userId) async {
    final uid = user!.id;
    await _friendService.update(userId, uid);
  }

  Future<String> generatePostId() async {
    var uuid = const Uuid();
    return uuid.v4();
  }
}

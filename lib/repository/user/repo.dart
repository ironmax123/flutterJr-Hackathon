import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/service/user/service.dart';
import 'package:room_check/utils/result.dart';

part 'repo.g.dart';

@riverpod
UserRepo userRepo(Ref ref) => UserRepo(
      ref: ref,
      userService: ref.read(userServiceProvider),
    );

@Riverpod(keepAlive: true)
class UserRepoCashe extends _$UserRepoCashe {
  @override
  Map<String, UserEntity> build() => {};
  void update(
    String id,
    UserEntity user,
  ) {
    state = {...state, id: user};
  }

  void updateUser(Result<UserEntity> currentUser) async {
    if (currentUser case Ok(:final value)) {
      final updatedUser = value.copyWith(
        username: value.username,
        avatar_url: value.avatar_url,
      );
      state = {...state, value.id: updatedUser};
    }
  }
}

class UserRepo {
  UserRepo({
    required Ref ref,
    required UserService userService,
  })  : _ref = ref,
        _userService = userService;

  final Ref _ref;
  final UserService _userService;

  Future<Result<UserEntity?>> getCurrentUser(
    String userId, {
    bool shouldRefresh = false,
  }) async {
    final cacheData = _ref.read(userRepoCasheProvider)[userId];
    final useCache = !shouldRefresh && cacheData != null;
    if (useCache) {
      log('cache hit');
      return Result.ok(cacheData);
    }
    final result = await _userService.getCurrentUser();
    switch (result) {
      case Ok(:final value):
        _ref.read(userRepoCasheProvider.notifier).update(userId, value);
        return Result.ok(value);
      case Error():
        return Result.error(result.error);
    }
  }

  Future<Result> updateUser(
    String userId, {
    required String? newName,
    required String? newIconUrl,
    bool shouldRefresh = false,
  }) async {
    final result = await _userService.getCurrentUser();

    await _userService.updateUserInfo(userId, newName, newIconUrl);
    switch (result) {
      case Ok(:final value):
        _ref.read(userRepoCasheProvider.notifier).update(userId, value);
        return Result.ok(value);
      case Error():
        return Result.error(result.error);
    }
  }

  Future<Result<List<UserEntity>>> getUsers(String uid) async {
    final result = await _userService.getUsers(uid);
    switch (result) {
      case Ok(:final value):
        return Result.ok(value);
      case Error():
        return Result.error(result.error);
    }
  }
}

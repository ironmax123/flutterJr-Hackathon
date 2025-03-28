import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/repository/post/repository.dart';
import 'package:room_check/repository/user/repository.dart';
import 'package:room_check/utils/result.dart';
part 'vm.freezed.dart';
part 'vm.g.dart';

@freezed
class UserPostsScreenState with _$UserPostsScreenState {
  @override
  const factory UserPostsScreenState({
    required List<PostEntity>? postEntity,
  }) = _UserPostsScreenState;
}

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    required String? imageUrl,
    required String? userName,
  }) = _UserInfoState;
}

@riverpod
class UserPostsScreenVM extends _$UserPostsScreenVM {
  @override
  void build() async {}
  Future<UserPostsScreenState> readUserPosts(String userId) async {
    final postRepo = ref.read(postRepoProvider);
    final postResult = await postRepo.readUserPosts(userId);
    switch (postResult) {
      case Ok(:final value):
        print(value);
        return UserPostsScreenState(postEntity: value);
      case Error():
        return const UserPostsScreenState(postEntity: null);
    }
  }


  Future<UserInfoState> getFriendInfo(String userId) async {
    final userRepo = ref.read(userRepoProvider);
    final result = await userRepo.getUsers(userId);

    switch (result) {
      case Ok(:final value):
        return UserInfoState(
          imageUrl: value.first.avatar_url,
          userName: value.first.username,
        );
      case Error():
        return const UserInfoState(
          imageUrl: null,
          userName: 'ユーザー情報の取得に失敗しました',
        );
    }
  }
}

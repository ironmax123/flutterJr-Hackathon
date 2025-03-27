import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/repository/post/repository.dart';
import 'package:room_check/repository/user/repository.dart';
import 'package:room_check/utils/result.dart';
part 'vm.freezed.dart';
part 'vm.g.dart';

@freezed
class PostsScreenState with _$PostsScreenState {
  @override
  const factory PostsScreenState({
    required List<PostEntity>? postEntity,
  }) = _PostsScreenState;
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String? imageUrl,
    required String? userName,
  }) = _UserInfo;
}

@riverpod
class PostsScreenVM extends _$PostsScreenVM {
  @override
  Future<PostsScreenState> build() async {
    final postRepo = ref.read(postRepoProvider);
    final postResult = await postRepo.readPosts();
    switch (postResult) {
      case Ok(:final value):
        return PostsScreenState(postEntity: value);
      case Error():
        return const PostsScreenState(postEntity: null);
    }
  }

  Future<UserInfo> getFriendInfo(String userId) async {
    final userRepo = ref.read(userRepoProvider);
    final result = await userRepo.getUsers(userId);

    switch (result) {
      case Ok(:final value):
        return UserInfo(
          imageUrl: value.first.avatar_url,
          userName: value.first.username,
        );
      case Error():
        return const UserInfo(
          imageUrl: null,
          userName: 'ユーザー情報の取得に失敗しました',
        );
    }
  }
}

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
        print(value);
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

  Future<String> consecutiveDate(String userId) async {
    final postRepo = ref.read(postRepoProvider);
    final result = await postRepo.readUserPosts(userId);
    final createdAts = switch (result) {
      Ok(:final value) => value.map((post) => post.created_at).toList(),
      Error() => <DateTime>[]
    };
    final dates = calculateStreak(createdAts);
    return "$dates日続いたよ！";
  }

  int calculateStreak(List<DateTime> postDates) {
    if (postDates.isEmpty) return 0;

    // created_at の降順（新しい順）にソート
    postDates.sort((a, b) => b.compareTo(a));

    int streak = 1; // 連続日数（最初の投稿はカウント）
    DateTime previousDate = postDates.first; // 最新の投稿日

    for (int i = 1; i < postDates.length; i++) {
      final difference = previousDate.difference(postDates[i]).inDays;

      if (difference == 1) {
        streak++; // 1日ずつ減っていれば連続
      } else if (difference > 1) {
        break; // 1日以上空いたら途切れる
      }

      previousDate = postDates[i]; // 次の比較対象へ
    }

    return streak;
  }
}

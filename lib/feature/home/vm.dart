import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/repository/post/repository.dart';
import 'package:room_check/repository/user/repository.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';

part 'vm.g.dart';
part 'vm.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  const factory HomeState({
    required UserEntity? userEntity,
  }) = _HomeState;
}

@riverpod
class HomeScreenVM extends _$HomeScreenVM {
  @override
  Future<HomeState> build() async {
    final userRepo = ref.read(userRepoProvider);
    final userInfo = await userRepo.getCurrentUser(user!.id);
    switch (userInfo) {
      case Ok(:final value):
        if (value != null) {
          return HomeState(userEntity: value);
        }
        return const HomeState(userEntity: null);

      case Error():
        return const HomeState(userEntity: null);
    }
  }

  void createPost(String? imageUrl) async {
    final postRepo = ref.read(postRepoProvider);

    final postId = await postRepo.generatePostId();
    DateTime getUTCNow() {
      return DateTime.now().toUtc();
    }

    final post = PostEntity(
      postId: postId,
      userId: user!.id,
      imageUrl: imageUrl,
      created_at: getUTCNow(),
    );
    await postRepo.createPost(post);
  }

  Future<void> onUserUpdated() async {
    final userId = user!.id;
    final userRepo = ref.read(userRepoProvider);

    final userInfo = await userRepo.getCurrentUser(userId);
    switch (userInfo) {
      case Ok(:final value):
        state = AsyncData(state.value!.copyWith(userEntity: value));
        break;
      case Error():
        // エラー時は何もしない
        break;
    }
  }
}

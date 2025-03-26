import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/repository/post/repository.dart';
import 'package:room_check/repository/user/repo.dart';
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
    final userInfo = await userRepo.getUser(user!.id);
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

    final post = PostEntity(
      postId: postId,
      userId: user!.id,
      imageUrl: imageUrl,
    );
    await postRepo.createPost(post);
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/repository/post/repository.dart';
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
}

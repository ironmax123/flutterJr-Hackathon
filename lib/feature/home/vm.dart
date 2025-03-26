import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/repository/post/repository.dart';
import 'package:room_check/supabase/supabase.dart';

part 'vm.g.dart';
part 'vm.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  const factory HomeState({
    required List<PostEntity>? posts,
  }) = _HomeState;
}

@riverpod
class HomeScreenVM extends _$HomeScreenVM {
  @override
  void build() async {}

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

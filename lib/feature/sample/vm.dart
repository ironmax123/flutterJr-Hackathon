import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/sample/entity.dart';
import 'package:room_check/repository/sample/repository.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';

part 'vm.g.dart';
part "vm.freezed.dart";

@freezed
class SampleScreenState with _$SampleScreenState {
  const factory SampleScreenState({
    required List<SampleEntity>? sampleEntity,
  }) = _SampleScreenState;
}

@riverpod
class SampleVM extends _$SampleVM {
  @override
  Future<SampleScreenState?> build() async {
    final postRepo = ref.read(sampleRepoProvider);
    final result = await postRepo.readPosts();
    switch (result) {
      case Ok(:final value):
        return SampleScreenState(sampleEntity: value);

      case Error():
        return const SampleScreenState(sampleEntity: null);
    }
  }

  void createPost(String? imageUrl) async {
    final postRepo = ref.read(sampleRepoProvider);

    final postId = await postRepo.generatePostId();

    final post = SampleEntity(
      postId: postId,
      userId: user!.id,
      imageUrl: imageUrl,
    );
    await postRepo.createPost(post);
  }

  void updatePosts() async {
    final repo = ref.read(sampleRepoProvider);
    final result = await repo.readPosts();
    switch (result) {
      case Ok(:final value):
        state = AsyncData(state.value?.copyWith(sampleEntity: value));
        break;
      case Error():
        state = AsyncData(state.value?.copyWith(sampleEntity: null));
        break;
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/repository/user/repo.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';

part "vm.g.dart";
part "vm.freezed.dart";

@freezed
class InvitationState with _$InvitationState {
  const factory InvitationState({
    required UserEntity? userEntity,
  }) = _InvitationState;
}

@riverpod
class InvitationSCreenVM extends _$InvitationSCreenVM {
  @override
  Future<InvitationState> build() async {
    final userRepo = ref.read(userRepoProvider);
    final userInfo = await userRepo.getCurrentUser(user!.id);
    switch (userInfo) {
      case Ok(:final value):
        if (value != null) {
          return InvitationState(userEntity: value);
        }
        return const InvitationState(userEntity: null);

      case Error():
        return const InvitationState(userEntity: null);
    }
  }

  void updateUrl(String username, String? newUrl) async {
    state = AsyncValue.data(state.value!.copyWith(
        userEntity: state.value!.userEntity?.copyWith(avatar_url: newUrl)));
    final userRepo = ref.read(userRepoProvider);
    userRepo.updateUser(
      user!.id,
      newName: username,
      newIconUrl: newUrl,
    );
  }

  void updateName(String newName, String? iconUrl) async {
    state = AsyncValue.data(state.value!.copyWith(
        userEntity: state.value!.userEntity?.copyWith(username: newName)));
    final userRepo = ref.read(userRepoProvider);
    userRepo.updateUser(
      user!.id,
      newName: newName,
      newIconUrl: iconUrl,
    );
  }
}

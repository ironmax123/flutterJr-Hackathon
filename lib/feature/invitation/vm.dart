import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/friend/entity.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/repository/friends/repository.dart';
import 'package:room_check/repository/user/repository.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';

part "vm.g.dart";
part "vm.freezed.dart";

@freezed
class InvitationState with _$InvitationState {
  const factory InvitationState({
    required UserEntity? userEntity,
    required List<FriendEntity>? friendEntity,
  }) = _InvitationState;
}

@riverpod
class InvitationSCreenVM extends _$InvitationSCreenVM {
  @override
  Future<InvitationState> build() async {
    final userRepo = ref.read(userRepoProvider);
    final friendRepo = ref.read(friendRepoProvider);

    final userInfo = await userRepo.getCurrentUser(user!.id);
    final friends = await friendRepo.readFriend();
    final friendsValue =
        switch (friends) { Ok(:final value) => value, Error() => null };
    switch (userInfo) {
      case Ok(:final value):
        if (value != null) {
          return InvitationState(
            userEntity: value,
            friendEntity: friendsValue,
          );
        }
        return const InvitationState(userEntity: null, friendEntity: null);

      case Error():
        return const InvitationState(userEntity: null, friendEntity: null);
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

  void addFriend(String userId) async {
    final friendRepo = ref.read(friendRepoProvider);
    await friendRepo.addUsers(userId);

    if (state.value != null) {
      final updatedFriends =
          List<FriendEntity>.from(state.value!.friendEntity ?? []);
      updatedFriends.add(FriendEntity(
          id: userId, friends: [])); // Provide the required 'friends' parameter
      state = AsyncData(state.value!.copyWith(friendEntity: updatedFriends));
    }
  }

  Future<String?> getFriendName(userId) async {
    final userRepo = ref.read(userRepoProvider);
    final result = await userRepo.getUsers(userId);

    switch (result) {
      case Ok(:final value):
        return value.first.username;

      case Error():
        return 'ユーザー名の取得に失敗しました';
    }
  }
}

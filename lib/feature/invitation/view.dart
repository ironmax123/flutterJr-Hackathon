import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/invitation/components/add_friend.dart';
import 'package:room_check/feature/invitation/components/dialog.dart';
import 'package:room_check/feature/invitation/components/friend_list.dart';
import 'package:room_check/feature/invitation/components/join_friend.dart';
import 'package:room_check/feature/invitation/components/user_info.dart';
import 'package:room_check/feature/invitation/vm.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/supabase/supabase.dart';

class InvitationScreen extends HookConsumerWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = useState('');
    useEffect(() {
      if (user == null) {
        uid.value = 'アプリを再起動してください';
      } else {
        uid.value = user!.id;
      }
      return null;
    }, []);

    final iconUrl = ref.watch(invitationSCreenVMProvider).when(
          data: (data) => data.userEntity?.avatar_url,
          loading: () => 'null',
          error: (err, stack) {
            log('エラー: $err');
            return 'null';
          },
        );
    final userName = ref.watch(invitationSCreenVMProvider).when(
          data: (data) => data.userEntity?.username,
          loading: () => '読み込み中...',
          error: (err, stack) {
            log('エラー: $err');
            return '読み込みエラー';
          },
        );
    final friendsId = ref.watch(invitationSCreenVMProvider).when(
          data: (data) => data.friendEntity?.friends,
          loading: () => '読み込み中...',
          error: (err, stack) {
            log('エラー: $err');
            return '読み込みエラー';
          },
        );

    final friendIdsList = useState<List<String>>([]);

    final friendList = useState<List<String>>([]);

    Future<void> fetchNames() async {
      friendList.value = []; // リストをクリア
      final updatedList = <String>[];
      for (var i = 0; i < friendIdsList.value.length; i++) {
        final result = await ref
            .read(invitationSCreenVMProvider.notifier)
            .getFriendName(friendIdsList.value[i]);

        updatedList.add(result.toString());
      }
      friendList.value = updatedList; // 新しいリストを再代入
    }

    useEffect(() {
      log('aaaiiii');
      if (friendsId is List) {
        friendIdsList.value = List<String>.from(friendsId);
        fetchNames();
      } else {
        log('friendsIdはリストではありません: $friendsId');
      }

      return null;
    }, [friendsId]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryWhiteGrey,
        actions: [
          IconButton(
            onPressed: () {
              showConfirmDialog(
                context,
                // 好きな文字列を入れてください。
                title: 'ログアウトしますか？',
                // 好きな文字列を入れてください。
                content: 'ログアウトすると再度ログインが必要です。',
                onApproved: () => context.pop(),
              );
            },
            icon: const Icon(
              Icons.logout,
              size: 48,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(invitationSCreenVMProvider.notifier).refresh();
        },
        child: ListView(
          children: [
            InvationScreenProfile(
              imageUrl: iconUrl,
              userName: userName,
            ),
            const Divider(
              color: AppColor.dividerColor,
            ),
            InvitationScreenFriendList(
              friendList: friendList.value,
              friendIdList: friendIdsList.value,
            ),
            const Divider(
              color: AppColor.dividerColor,
            ),
            InvitationScreenAddFriend(
              uid: uid.value,
              name: userName,
            ),
            const Divider(color: AppColor.dividerColor),
            InvationScreenJoinFriend(
              uid: uid.value,
              name: userName,
            ),
          ],
        ),
      ),
    );
  }
}

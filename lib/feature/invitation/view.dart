import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:room_check/feature/invitation/components/add_friend.dart';
import 'package:room_check/feature/invitation/components/dialog.dart';
import 'package:room_check/feature/invitation/components/friend_list.dart';
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
      body: ListView(
        children: [
          InvationScreenProfile(
            imageUrl: iconUrl,
            userName: userName,
          ),
          const Divider(
            color: AppColor.dividerColor,
          ),
          const InvitationScreenFriendList(
            friendList: [
              '太郎',
              '花子',
              '次郎',
              '三郎',
              '四郎',
            ],
          ),
          const Divider(
            color: AppColor.dividerColor,
          ),
          InvitationScreenAddFriend(uid: uid.value)
        ],
      ),
    );
  }
}

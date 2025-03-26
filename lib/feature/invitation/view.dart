import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/feature/invitation/components/add_friend.dart';
import 'package:room_check/feature/invitation/components/dialog.dart';
import 'package:room_check/feature/invitation/components/friend_list.dart';
import 'package:room_check/feature/invitation/components/user_info.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/supabase/supabase.dart';

class InvationScreen extends StatelessWidget {
  const InvationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                onApproved: () {
                  // はい が押された時の処理を入れる。
                  // 以下は例
                  context.pop();
                },
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
          const InvationScreenProfile(
            imageUrl: '',
            userName: '翔太',
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
          InvitationScreenAddFriend(uid: user!.id)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/primary/components/user_icon.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/utils/timeago.dart';

class PostsScreenUserInfo extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final DateTime timeAgo;
  final String userId;
  const PostsScreenUserInfo({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.timeAgo,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryUserIcon(
          onTap: () => context.push('/userposts', extra: userId),
          imageUrl: imageUrl,
        ),
        const Gap(10),
        Text(
          userName,
          style: const TextStyle(
            color: AppColor.primaryBlack,
            fontSize: 20,
          ),
        ),
        const Gap(4),
        Text(
          createTimeAgoString(timeAgo),
          style: const TextStyle(
            color: AppColor.primaryBlackGrey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

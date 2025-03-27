import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:room_check/primary/components/user_icon.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/utils/timeago.dart';

class PostsScreenUserInfo extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final DateTime timeAgo;
  const PostsScreenUserInfo({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryUserIcon(
          onTap: () {},
          imageUrl: imageUrl,
        ),
        const Gap(10),
        Text(
          userName,
          style: const TextStyle(
            color: AppColor.primaryBlack,
            fontSize: 24,
          ),
        ),
        const Gap(4),
        Text(
          createTimeAgoString(timeAgo),
          style: const TextStyle(
            color: AppColor.primaryBlackGrey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

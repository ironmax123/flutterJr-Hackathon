import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:room_check/primary/components/user_icon.dart';
import 'package:room_check/primary/utils/color.dart';

class UserPostsScreenUserInfo extends StatelessWidget {
  final String imageUrl;
  final String userName;
  const UserPostsScreenUserInfo({
    super.key,
    required this.imageUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(35),
              PrimaryUserIcon(
                heigt: 56,
                width: 56,
                onTap: () {},
                imageUrl: imageUrl,
              ),
              const Gap(24),
              Text(
                userName,
                style: const TextStyle(
                  color: AppColor.primaryBlack,
                  fontSize: 32,
                ),
              ),
            ],
          );
  }
}

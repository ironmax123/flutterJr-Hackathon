import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/primary/utils/color.dart';

class InvitationScreenFriendList extends StatelessWidget {
  final List<String>? friendList;
  final List<String>? friendIdList;
  const InvitationScreenFriendList(
      {super.key, required this.friendList, required this.friendIdList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '共有されるともだち',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColor.primaryBlack,
            ),
          ),
          const Gap(20),
          friendList == null || friendList!.isEmpty
              ? const Text(
                  'ともだちが見つからなかったよ😢',
                  style: TextStyle(
                    color: AppColor.primaryBlack,
                    fontSize: 16,
                  ),
                )
              : ListView.builder(
                  itemCount: friendList!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => context.push('/userposts',
                              extra: friendIdList![index]),
                          child: Text(
                            friendList![index],
                            style: const TextStyle(
                              color: AppColor.primaryBlack,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Gap(8),
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}

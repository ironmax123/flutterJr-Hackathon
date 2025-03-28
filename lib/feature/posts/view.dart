import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/posts/components/user_info.dart';
import 'package:room_check/feature/posts/vm.dart';
import 'package:room_check/primary/utils/color.dart';

class PostsScreen extends HookConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(postsScreenVMProvider).when(
          data: (data) => data.postEntity,
          loading: () => 'roading',
          error: (err, stack) {
            log('error: $err');
            return 'error';
          },
        );
    final data = postData is List<dynamic> ? postData : [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryWhiteGrey,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return FutureBuilder<UserInfo>(
            future: ref
                .read(postsScreenVMProvider.notifier)
                .getFriendInfo(data[index].userId),
            builder: (context, snapshot) {
              final userInfo = snapshot.data;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostsScreenUserInfo(
                      imageUrl: userInfo?.imageUrl ?? '',
                      userName: userInfo?.userName ?? '読み込み中...',
                      timeAgo: data[index].created_at,
                      userId: userInfo?.userId ?? '',
                    ),
                    const Gap(10),
                    Center(
                      child: CachedNetworkImage(
                        width: 340,
                        imageUrl: data[index].imageUrl,
                      ),
                    ),
                    const Gap(14),
                    const Divider(color: AppColor.dividerColor),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

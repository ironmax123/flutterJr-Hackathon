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
    print(postData);
    final data = postData is List<dynamic> ? postData : [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryWhiteGrey,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostsScreenUserInfo(
                    imageUrl:
                        'https://images.unsplash.com/photo-1515513284006-9a59075694b7?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    userName: 'userName',
                    timeAgo: data[index].created_at,
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
          }),
    );
  }
}

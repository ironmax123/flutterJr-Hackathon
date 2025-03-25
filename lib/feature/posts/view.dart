import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:room_check/primary/components/user_icon.dart';
import 'package:room_check/primary/utils/color.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts Screen')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryUserIcon(
                onTap: () {},
                imageUrl: 'null',
                ),
          
              Center(
                child: CachedNetworkImage(
                  width: 340,
                  imageUrl: 'https://images.unsplash.com/photo-1515513284006-9a59075694b7?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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

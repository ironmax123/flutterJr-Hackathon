import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';

class SampleScreenImageView extends StatelessWidget {
  final String imageUrl;
  const SampleScreenImageView({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserInfo(),
          Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.account_circle,
          size: 48,
        ),
        Gap(16),
        Text(
          'ユーザー名',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

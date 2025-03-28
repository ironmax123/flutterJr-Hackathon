import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:share_plus/share_plus.dart';

class InvitationScreenAddFriend extends HookConsumerWidget {
  final String uid;
  final String? name;
  const InvitationScreenAddFriend({
    super.key,
    required this.uid,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ともだちを招待',
            style: TextStyle(
              color: AppColor.primaryBlack,
              fontSize: 24,
            ),
          ),
          Center(
            child: QrImageView(
              data: uid,
              size: 180,
            ),
          ),
          const Gap(14),
          Center(
            child: ShareUid(
              uid: uid,
              name: name,
            ),
          ),
          const Gap(32),
        ],
      ),
    );
  }
}

class ShareUid extends StatelessWidget {
  final String uid;
  final String? name;
  const ShareUid({
    super.key,
    required this.uid,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.primaryGrey, // 背景色設定
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ), // 余白を追加
      child: Row(
        children: [
          Expanded(
            // オーバーフロー防止
            child: Text(
              uid,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
          const Gap(12),
          FilledButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: AppColor.primaryNavy,
                width: 2,
              ),
              backgroundColor: AppColor.primaryOceanTeal,
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: uid));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("コピーしました！")),
              );
            },
            icon: const Icon(Icons.copy),
            label: const Text('copy'),
          ),
          const Gap(8),
          IconButton(
            onPressed: () {
              final text = "$nameから誘いが来ています \n \n$uid\n \nでピカトモに追加しよう!!!";
              const subject = "共有先を選択";
              Share.share(
                text,
                subject: subject,
              );
            },
            icon: const Icon(
              Icons.share_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

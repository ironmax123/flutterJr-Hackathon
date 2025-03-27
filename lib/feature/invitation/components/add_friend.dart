import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:room_check/feature/invitation/vm.dart';
import 'package:room_check/primary/components/gradient_button.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/primary/utils/gradient_style.dart';

class InvitationScreenAddFriend extends HookConsumerWidget {
  final String uid;
  const InvitationScreenAddFriend({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImvationFriend(),
          Center(
            child: QrImageView(
              data: uid,
              size: 180,
            ),
          ),
          const Gap(14),
          Center(child: ShareUid(uid: uid)),
          const Gap(32),
          InputUid(controller: controller),
          const Gap(12),
          Center(
            child: PrimaryGradientButton(
              outlineColor: AppColor.primaryWhite,
              gradient: GradientStyle.pinkGradient,
              text: '参加する',
              onPressed: () {
                ref
                    .read(invitationSCreenVMProvider.notifier)
                    .addFriend(controller.value.text);
              },
            ),
          )
        ],
      ),
    );
  }
}

class ShareUid extends StatelessWidget {
  final String uid;
  const ShareUid({
    super.key,
    required this.uid,
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
              //TODO: SNSシェア追加
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

class InputUid extends HookWidget {
  final TextEditingController controller;
  const InputUid({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (e) {
        primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        fillColor: AppColor.primaryWhiteGrey,
        filled: true, // 背景色を適用
        labelText: '共有されたIDを入力',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class ImvationFriend extends StatelessWidget {
  const ImvationFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '友達を招待',
          style: TextStyle(
            color: AppColor.primaryBlack,
            fontSize: 24,
          ),
        ),
        const Gap(16),
        PrimaryGradientButton(
          outlineColor: AppColor.primaryWhite,
          gradient: GradientStyle.pinkGradient,
          text: 'QRコード読み取り',
          fontSize: 12,
          horizontal: 32,
          onPressed: () {
            //TODO: QR読み取り処理追加
          },
        ),
      ],
    );
  }
}

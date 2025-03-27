import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:room_check/feature/invitation/scan/scan.dart';
import 'package:room_check/feature/invitation/vm.dart';
import 'package:room_check/primary/components/gradient_button.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/primary/utils/gradient_style.dart';
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
    final controller = useTextEditingController();
    final readData = useState('');
    final typeData = useState('');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImvationFriend(
            readData: readData,
            typeData: typeData,
            controller: controller,
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
          InputUid(controller: controller),
          const Gap(12),
          Center(
            child: PrimaryGradientButton(
              outlineColor: AppColor.primaryWhite,
              gradient: GradientStyle.pinkGradient,
              text: '参加する',
              onPressed: () async {
                ref
                    .read(invitationSCreenVMProvider.notifier)
                    .addFriend(controller.value.text);
                controller.clear();
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
  final ValueNotifier readData;
  final ValueNotifier typeData;
  final TextEditingController controller;
  const ImvationFriend({
    super.key,
    required this.readData,
    required this.typeData,
    required this.controller,
  });

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
          onPressed: () async {
            await scan(readData, typeData);
            controller.text = await readData.value;
          },
        ),
      ],
    );
  }
}

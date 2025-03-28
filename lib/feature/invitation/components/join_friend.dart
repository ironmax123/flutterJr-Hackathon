import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/invitation/scan/scan.dart';
import 'package:room_check/feature/invitation/vm.dart';
import 'package:room_check/primary/components/gradient_button.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/primary/utils/gradient_style.dart';
import 'package:room_check/supabase/supabase.dart';

class InvationScreenJoinFriend extends HookConsumerWidget {
  final String uid;
  final String? name;
  const InvationScreenJoinFriend({
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
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ImvationFriend(
            readData: readData,
            typeData: typeData,
            controller: controller,
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
                ref.read(invitationSCreenVMProvider.notifier).addFriend(
                      controller.value.text,
                      user!.id,
                    );
                controller.clear();
              },
            ),
          ),
          const Gap(34),
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
    return Column(
      children: [
        const Text(
          'ともだちを追加',
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

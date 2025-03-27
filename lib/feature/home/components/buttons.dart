import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:room_check/primary/components/gradient_button.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/primary/utils/gradient_style.dart';

class HomeScreenButtons extends StatelessWidget {
  final ValueNotifier isStart;
  final ValueNotifier totalTime;
  const HomeScreenButtons({
    super.key,
    required this.isStart,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isStart.value
            ? Container()
            : PrimaryGradientButton(
                outlineColor: AppColor.primaryBlack,
                gradient: GradientStyle.blueGradient,
                text: '撮影',
                onPressed: () async {
                  isStart.value = true;
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 32,
                  color: AppColor.primaryWhite,
                ),
              ),
        const Gap(28),
        PrimaryGradientButton(
          outlineColor: AppColor.primaryBlack,
          gradient: GradientStyle.blueGradient,
          text: '友達の写真を見る',
          onPressed: () {},
        ),
        const Gap(28),
      ],
    );
  }
}

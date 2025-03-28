import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/feature/invitation/components/update_profile.dart';
import 'package:room_check/primary/components/gradient_button.dart';
import 'package:room_check/primary/components/user_icon.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/primary/utils/gradient_style.dart';
import 'package:room_check/supabase/supabase.dart';

class InvationScreenProfile extends StatelessWidget {
  final String? imageUrl;
  final String? userName;
  const InvationScreenProfile({
    super.key,
    required this.imageUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GestureDetector(
            onTap: () => context.push('/userposts', extra: user!.id),
            child: Row(
              children: [
                PrimaryUserIcon(
                  imageUrl: imageUrl ?? 'null',
                  width: 68,
                  heigt: 68,
                ),
                const Gap(24),
                Text(
                  userName!,
                  style: const TextStyle(
                    color: AppColor.primaryBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
        const Gap(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: PrimaryGradientButton(
            outlineColor: AppColor.primaryBlack,
            gradient: GradientStyle.blueGradient,
            fontSize: 20,
            text: 'プロフィールを更新する',
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AccountUpdateProfileDialog(
                  userName: userName,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

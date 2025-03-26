import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/feature/login/login.dart';
import 'package:room_check/primary/utils/color.dart';

class LoginPageCard extends HookWidget {
  const LoginPageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mail = useState('');
    final pass = useState('');
    final mailController = useTextEditingController();
    final passController = useTextEditingController();
    final isObscure = useState(true);
    final isLogin = useState('');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Card(
          color: AppColor.primaryWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 33,
              horizontal: 16,
            ),
            child: Column(
              children: [
                TextField(
                  controller: mailController,
                  onChanged: (value) {
                    mail.value = value;
                  },
                  decoration: InputDecoration(
                    fillColor: AppColor.primaryWhiteGrey,
                    labelText: 'メールアドレス',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const Gap(14),
                TextField(
                  obscureText: isObscure.value,
                  controller: passController,
                  onChanged: (value) {
                    pass.value = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        isObscure.value = !isObscure.value;
                      },
                    ),
                  ),
                ),
                const Gap(30),
                OutlinedButton(
                  onPressed: () async {
                    if (mail.value.isNotEmpty || pass.value.isNotEmpty) {
                      isLogin.value =
                          await loginWithPassword(mail.value, pass.value);
                      if (isLogin.value == 'ok') {
                        // ignore: use_build_context_synchronously
                        context.go('/home');
                      } else {
                        //TODO:スナックバー
                      }
                    } else {
                      return;
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlackGrey,
                    side: const BorderSide(
                      color: AppColor.primaryWhite,
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'ログイン',
                    style: TextStyle(
                      color: AppColor.primaryWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(30),
                OutlinedButton(
                  onPressed: () async {
                    context.push('/sing_up');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlackGrey,
                    side: const BorderSide(
                      color: AppColor.primaryWhite,
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    '登録',
                    style: TextStyle(
                      color: AppColor.primaryWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

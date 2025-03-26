// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:room_check/feature/sign_up/sign_up.dart';
import 'package:room_check/primary/utils/color.dart';

class SingUpPageCard extends HookWidget {
  const SingUpPageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mail = useState('');
    final pass = useState('');
    final name = useState('');
    final mailController = useTextEditingController();
    final passController = useTextEditingController();
    final nameController = useTextEditingController();
    final isObscure = useState(true);

    final selectedImage = useState<File?>(null);
    final imageUrl = useState<String?>(null);

    Future<void> album() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 33,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(128),
                  child: selectedImage.value != null
                      ? Image.file(
                          selectedImage.value!,
                          width: 88,
                          height: 88,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.account_circle, size: 88),
                ),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlackGrey,
                    side: const BorderSide(
                      color: AppColor.primaryBlack,
                      width: 1,
                    ),
                  ),
                  onPressed: () {
                    album();
                  },
                  child: const Text(
                    '画像を選択',
                    style: TextStyle(
                      color: AppColor.primaryWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const Gap(24),
              TextField(
                controller: mailController,
                onChanged: (value) {
                  mail.value = value;
                },
                decoration: InputDecoration(
                  labelText: 'メールアドレス',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Gap(20),
              TextField(
                controller: nameController,
                onChanged: (value) {
                  name.value = value;
                },
                decoration: InputDecoration(
                  labelText: 'ニックネーム',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Gap(20),
              TextField(
                controller: passController,
                obscureText: isObscure.value,
                onChanged: (value) {
                  pass.value = value;
                },
                decoration: InputDecoration(
                  fillColor: AppColor.primaryBlackGrey,
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
              const Gap(40),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColor.primaryBlackGrey,
                  side: const BorderSide(
                    color: AppColor.primaryBlack,
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                ),
                onPressed: () async {
                  if (mail.value.isNotEmpty ||
                      pass.value.isNotEmpty ||
                      name.value.isNotEmpty) {
                    imageUrl.value = await uploadImage(selectedImage.value);
                    await signUp(
                      mail.value,
                      pass.value,
                      name.value,
                      imageUrl.value,
                    );
                  } else {
                    return;
                  }
                  context.go('/login');
                },
                child: const Text(
                  '登録',
                  style: TextStyle(
                    color: AppColor.primaryWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

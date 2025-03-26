import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:room_check/feature/invitation/vm.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountUpdateProfileDialog extends HookConsumerWidget {
  final String? userName;
  const AccountUpdateProfileDialog({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = useState<File?>(null);
    final imageUrl = useState<String?>(null);
    final supabase = Supabase.instance.client;
    final newName = useState('');
    final nameController = useTextEditingController();

    final iconUrl = ref.watch(invitationSCreenVMProvider).when(
          data: (data) => data.userEntity!.avatar_url,
          loading: () => null,
          error: (err, stack) {
            log('エラー: $err');
            return null;
          },
        );

    Future<File?> album() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        return selectedImage.value = File(pickedFile.path);
      }
      return null;
    }

    Future<String?> updateIcon(String? currentIconUrl) async {
      if (currentIconUrl != null && currentIconUrl.isNotEmpty) {
        final oldPath =
            currentIconUrl.split('/storage/v1/object/public/avatar/').last;
        await supabase.storage.from('avatar').remove([oldPath]);
      }

      // 新しい画像をアップロード
      if (selectedImage.value != null) {
        final fileBytes = await selectedImage.value!.readAsBytes();
        final fileName = 'avatar/${DateTime.now().toIso8601String()}.png';
        await supabase.storage.from('avatar').uploadBinary(fileName, fileBytes,
            fileOptions: const FileOptions(upsert: true));
        final newUrl = supabase.storage.from('avatar').getPublicUrl(fileName);

        // ユーザーのメタデータを更新
        await supabase.auth.updateUser(
          UserAttributes(data: {'avatar_url': newUrl}),
        );
        return newUrl;
      }

      return null;
    }

    Future<void> updateUserName(String newUserName) async {
      try {
        final response = await Supabase.instance.client.auth.updateUser(
          UserAttributes(data: {'username': newUserName}), // 🔹 ユーザー名を更新
        );

        if (response.user != null) {
          log('ユーザー名が更新されました: ${response.user!.userMetadata?['username']}');
        }
      } on AuthException catch (error) {
        log('ユーザー名の更新に失敗しました: ${error.message}');
      } on Exception catch (e) {
        log('エラー: $e');
      }
    }

    return AlertDialog(
      title: const Text("プロフィールを編集"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                    : (iconUrl != null && iconUrl.isNotEmpty)
                        ? CachedNetworkImage(
                            imageUrl: iconUrl,
                            width: 88,
                            height: 88,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => const Icon(
                              Icons.account_circle,
                              size: 88,
                            ),
                          )
                        : const Icon(
                            Icons.account_circle,
                            size: 88,
                          ),
              ),
            ),
            const Gap(8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.primaryBlackGrey,
                    side: const BorderSide(
                      color: AppColor.primaryBlack,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () async {
                    await album();
                  },
                  child: const Text('画像を選択',
                      style: TextStyle(
                        color: AppColor.primaryWhite,
                        fontSize: 24,
                      ))),
            ),
            const Gap(16),
            TextField(
              controller: nameController,
              onChanged: (value) {
                newName.value = value;
              },
              decoration: InputDecoration(
                labelText: '新しいユーザー名',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "キャンセル",
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (selectedImage.value != null) {
              imageUrl.value = await updateIcon(iconUrl);
              ref
                  .read(invitationSCreenVMProvider.notifier)
                  .updateUrl(userName!, imageUrl.value);
            }
            if (newName.value != '') {
              await updateUserName(newName.value);
              ref
                  .read(invitationSCreenVMProvider.notifier)
                  .updateName(newName.value, iconUrl);
            }
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: const Text(
            "確定",
            style: TextStyle(
              fontSize: 24,
              color: AppColor.primaryBlack,
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/sample/vm.dart';
import 'package:room_check/repository/sample/repository.dart';

class SamplePostButton extends HookConsumerWidget {
  final ValueNotifier selectedImage;

  const SamplePostButton({
    super.key,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            minimumSize: const Size(165, 48),
            side: const BorderSide(color: Colors.green),
            elevation: 5,
          ),
          onPressed: () async {
            imageUrl.value = await ref
                .read(sampleRepoProvider)
                .uploadImage(selectedImage.value);
            log("imageUrl:${imageUrl.value}");
            ref.read(sampleVMProvider.notifier).createPost(imageUrl.value);
            selectedImage.value = null;
          },
          child: const Text(
            '投稿',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          )),
    );
  }
}

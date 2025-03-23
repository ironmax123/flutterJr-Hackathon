import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SampleImagePick extends StatelessWidget {
  final ValueNotifier selectedImage;

  const SampleImagePick({
    super.key,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> album() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Align(
        alignment: Alignment.centerLeft,
        child: selectedImage.value != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        selectedImage.value = null;
                      },
                      icon: const Icon(Icons.close)),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 32,
                      ),
                      child: Image.file(
                        selectedImage.value!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ) // 画像を表示
            : TextButton(
                onPressed: () => album(),
                child: const Text(
                  '画像を選択',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
              ),
      ),
    );
  }
}

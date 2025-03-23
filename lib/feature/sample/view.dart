import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/feature/sample/components/image_pick.dart';
import 'package:room_check/feature/sample/components/image_view.dart';
import 'package:room_check/feature/sample/components/post_button.dart';
import 'package:room_check/feature/sample/vm.dart';
import 'package:room_check/repository/sample/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SampleScreen extends HookConsumerWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = useState<File?>(null);

    final postData = ref.watch(sampleVMProvider).when(
          data: (data) => data?.sampleEntity,
          loading: () => 'null',
          error: (err, stack) {
            log('エラー: $err');
            return 'エラー';
          },
        );

    final data = postData is List<dynamic> ? postData : [];
    final cache = ref.watch(sampleRepoCasheProvider);

    useEffect(() {
      ref.read(sampleVMProvider.notifier).updatePosts();
      return null;
    }, [cache]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Screen'),
        leading: IconButton(
          onPressed: () async {
            await Supabase.instance.client.auth.signInWithPassword(
              email: "samle@test.com",
              password: "password",
            );
          },
          icon: const Icon(Icons.login),
        ),
      ),
      body: ListView(
        children: [
          SampleImagePick(selectedImage: selectedImage),
          const Gap(16),
          SamplePostButton(selectedImage: selectedImage),
          const Gap(16),
          const Divider(),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SampleScreenImageView(
                    imageUrl: data[index].imageUrl,
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

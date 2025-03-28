import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/feature/userposts/components/user_only_info.dart';
import 'package:room_check/feature/userposts/vm.dart';
import 'package:room_check/primary/utils/color.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/timeago.dart';

class UserPostsScreen extends HookConsumerWidget {
  const UserPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataFuture =
        ref.read(userPostsScreenVMProvider.notifier).getFriendInfo(user!.id);
    final dateData =
        ref.read(userPostsScreenVMProvider.notifier).consecutiveDate(user!.id);
    final consecutiveDate = useState("読み込み中...");

    final data = useState<List<PostEntity>?>([]);
    Future<void> fetchPosts() async {
      final postState = await ref
          .read(userPostsScreenVMProvider.notifier)
          .readUserPosts(user!.id);
      data.value = postState.postEntity; // 更新
      consecutiveDate.value = await dateData;
    }

    useEffect(() {
      fetchPosts(); // 非同期データ取得

      return null; // クリーンアップ不要
    }, []);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryWhiteGrey,
        title: Text(consecutiveDate.value,
            style: const TextStyle(
              color: AppColor.primaryBlack,
              fontSize: 24,
            )),
      ),
      body: Column(
        children: [
          const Gap(13),
          FutureBuilder<UserInfoState>(
            future: userDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final userData = snapshot.data!;
                return UserPostsScreenUserInfo(
                  imageUrl: userData.imageUrl ?? "null",
                  userName: userData.userName ?? '読み込みできません',
                );
              } else {
                return const Text('No data available');
              }
            },
          ),
          const Gap(5),
          const Divider(color: AppColor.dividerColor),
          const Gap(5),
          Expanded(
            child: ListView.builder(
                itemCount: data.value?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            createTimeAgoString(data.value![index].created_at),
                            style: const TextStyle(
                              color: AppColor.primaryBlackGrey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Center(
                          child: CachedNetworkImage(
                            width: 340,
                            imageUrl: data.value![index].imageUrl ?? '',
                          ),
                        ),
                        const Gap(14),
                        const Divider(color: AppColor.dividerColor),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

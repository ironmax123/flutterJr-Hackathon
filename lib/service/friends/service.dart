import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/friend/entity.dart';
import 'package:room_check/supabase/provider.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'service.g.dart';

@riverpod
FriendService friendService(ref) {
  final supabaseClient = ref.read(supabaseClientProvider);
  return FriendService(supabaseClient);
}

class FriendService {
  final SupabaseClient supabaseClient;

  FriendService(this.supabaseClient);

  /// supabase に投稿を追加（myId を userId の friends に追加）
  /// supabase に投稿を追加（myId と userId 双方に friends を追加）
  Future<void> update(String userId, String myId) async {
    try {
      // 1️⃣ myId の friends リストを取得
      final myResponse = await supabase
          .from('friend')
          .select('friends')
          .eq('id', myId)
          .single();

      // 2️⃣ userId の friends リストを取得
      final userResponse = await supabase
          .from('friend')
          .select('friends')
          .eq('id', userId)
          .single();

      // 3️⃣ myId の friends に userId を追加
      final List<String> myFriends =
          List<String>.from(myResponse['friends'] ?? []);
      if (!myFriends.contains(userId)) {
        myFriends.add(userId);
        // 4️⃣ Supabase で myId の friends を更新
        await supabase
            .from('friend')
            .update({'friends': myFriends}).eq('id', myId);
        log('myId に userId を追加しました: $myId -> $userId');
      } else {
        log('myId に userId はすでに含まれています');
      }

      // 5️⃣ userId の friends に myId を追加
      final List<String> userFriends =
          List<String>.from(userResponse['friends'] ?? []);
      if (!userFriends.contains(myId)) {
        userFriends.add(myId);
        // 6️⃣ Supabase で userId の friends を更新
        await supabase
            .from('friend')
            .update({'friends': userFriends}).eq('id', userId);
        log('userId に myId を追加しました: $userId -> $myId');
      } else {
        log('userId に myId はすでに含まれています');
      }
    } catch (e) {
      log('エラー: $e');
    }
  }

  /// 投稿をsupabaseから取得
  Future<Result<List<FriendEntity>>> read() async {
    final uid = user!.id;

    final List<Map<String, dynamic>> response =
        await supabase.from('friend').select().eq('id', uid);
    try {
      return Result.ok(
          response.map((data) => FriendEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}

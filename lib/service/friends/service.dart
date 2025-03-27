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
  Future<void> update(String userId, String myId) async {
    try {
      // 1️⃣ userId に一致するカラムの friends を取得
      final response = await supabase
          .from('friend')
          .select('friends')
          .eq('id', userId)
          .single();

      if (response == null) {
        log('ユーザーが見つかりませんでした: $userId');
        return;
      }

      // 2️⃣ 既存の friends リストを取得
      final List<String> friends = List<String>.from(response['friends'] ?? []);

      // 3️⃣ myId を friends に追加（重複チェックあり）
      if (!friends.contains(myId)) {
        friends.add(myId);
      } else {
        log('すでに friends に含まれています: $myId');
        return;
      }

      // 4️⃣ Supabase に更新リクエストを送信
      final updateResponse = await supabase
          .from('friend')
          .update({'friends': friends}).eq('id', userId);

      log('更新結果: $updateResponse');
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

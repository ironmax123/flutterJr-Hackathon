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

  /// supabaseに投稿を追加
  Future<void> update(String userId) async {
    final uid = user!.id;

    // 1️⃣ 現在の friends リストを取得
    final response =
        await supabase.from('friend').select('friends').eq('id', uid).single();

    // 2️⃣ 既存の friends リストに userId を追加
    final List<String> friends = List<String>.from(response['friends'] ?? []);
    if (!friends.contains(userId)) {
      friends.add(userId);
    }

    // 3️⃣ Supabase に更新リクエストを送信
    final updateResponse = await supabase
        .from('friend')
        .update({'friends': friends}).eq('id', uid);

    log('更新結果: $updateResponse');
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

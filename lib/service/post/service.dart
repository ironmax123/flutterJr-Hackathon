import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/post/entity.dart';
import 'package:room_check/supabase/provider.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'service.g.dart';

@riverpod
PostService postService(ref) {
  final supabaseClient = ref.read(supabaseClientProvider);
  return PostService(supabaseClient);
}

class PostService {
  final SupabaseClient supabaseClient;

  PostService(this.supabaseClient);

  /// supabaseに投稿を追加
  Future<Result<List<PostEntity>>> insert(PostEntity post) async {
    try {
      final List<Map<String, dynamic>> response = await supabaseClient
          .from('room_photo')
          .insert(post.toJson())
          .select();
      return Result.ok(
          response.map((data) => PostEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  /// 投稿をsupabaseから取得
  Future<Result<List<PostEntity>>> read(String myId) async {
    try {
      // 1️⃣ 自分の friends リストを取得
      final friendResponse = await supabase
          .from('friend')
          .select('friends')
          .eq('id', myId)
          .single();

      if (friendResponse['friends'] == null) {
        return const Result.ok([]); // 友達がいなければ空リストを返す
      }

      // 2️⃣ friends リストを取得（String の List に変換）
      final List<String> friends = List<String>.from(friendResponse['friends']);

      // 3️⃣ 自分の id も friends リストに追加
      if (!friends.contains(myId)) {
        friends.add(myId);
      }

      // 4️⃣ room_photo から投稿データを取得
      final List<Map<String, dynamic>> response = await supabase
          .from('room_photo')
          .select()
          .order('created_at', ascending: false);

      // 5️⃣ friends + 自分の userId と一致する投稿だけをフィルタリング
      final filteredPosts = response
          .where((data) => friends.contains(data['userId'])) // 一致するものを抽出
          .map((data) => PostEntity.fromJson(data))
          .toList();

      // 6️⃣ 結果を返す
      return Result.ok(filteredPosts);
    } catch (e) {
      // 例外時にエラーを返す
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<List<PostEntity>>> readUserPosts(String userId) async {
    try {
      final List<Map<String, dynamic>> response = await supabase
          .from('room_photo')
          .select()
          .eq('userId', userId)
          .order('created_at', ascending: false);
      return Result.ok(
          response.map((data) => PostEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}

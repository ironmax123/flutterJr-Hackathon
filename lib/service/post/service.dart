import 'dart:developer';

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
      log('🈂️$response');
      return Result.ok(
          response.map((data) => PostEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  /// 投稿をsupabaseから取得
  Future<Result<List<PostEntity>>> read() async {
    final List<Map<String, dynamic>> response = await supabase
        .from('room_photo')
        .select()
        .order('created_at', ascending: false);
    try {
      return Result.ok(
          response.map((data) => PostEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}

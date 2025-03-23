import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/sample/entity.dart';
import 'package:room_check/supabase/provider.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'service.g.dart';

@riverpod
SampleService sampleService(ref) {
  final supabaseClient = ref.read(supabaseClientProvider);
  return SampleService(supabaseClient);
}

class SampleService {
  final SupabaseClient supabaseClient;

  SampleService(this.supabaseClient);

  /// supabaseに投稿を追加
  Future<Result<List<SampleEntity>>> insert(SampleEntity post) async {
    try {
      final List<Map<String, dynamic>> response =
          await supabaseClient.from('sample').insert(post.toJson()).select();
      return Result.ok(
          response.map((data) => SampleEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  /// 投稿をsupabaseから取得
  Future<Result<List<SampleEntity>>> read() async {
    final uid = user?.id;
    final List<Map<String, dynamic>> response = await supabase
        .from('sample')
        .select()
        .eq('userId', uid.toString())
        .order('created_at', ascending: false);
    try {
      return Result.ok(
          response.map((data) => SampleEntity.fromJson(data)).toList());
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}

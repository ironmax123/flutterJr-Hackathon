import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/supabase/provider.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:room_check/utils/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'service.g.dart';

@riverpod
UserService userService(ref) {
  final supabaseClient = ref.read(supabaseClientProvider);
  return UserService(supabaseClient);
}

class UserService {
  final SupabaseClient supabaseClient;

  UserService(this.supabaseClient);

  /// **ログイン中のユーザー情報を取得**
  Future<Result<UserEntity>> getCurrentUser() async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) return Result.error(Exception("User not found"));

      return Result.ok(UserEntity.fromJson({
        "id": user.id,
        ...?user.userMetadata,
      }));
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  Future<Result<List<UserEntity>>> getUsers(String uid) async {
    //変数などの定義
    final List<Map<String, dynamic>> response =
        await supabase.from('userTable').select().eq('id', uid);
    //機能の実装
    try {
      return Result.ok(
          response.map((data) => UserEntity.fromJson(data)).toList());
    }
    //エラー処理
    catch (e) {
      return Result.error(Exception(e));
    }
  }
}

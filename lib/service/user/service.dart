import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/data/user/entity.dart';
import 'package:room_check/supabase/provider.dart';
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
  Future<Result<UserEntity>> getUser() async {
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
}

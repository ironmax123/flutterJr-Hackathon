import 'package:supabase_flutter/supabase_flutter.dart';

/// supabaseのインスタンス
final supabase = Supabase.instance.client;

/// userの情報
User? user = Supabase.instance.client.auth.currentUser;

Future<void> refreshAuthSession() async {
  await Supabase.instance.client.auth.refreshSession();
}

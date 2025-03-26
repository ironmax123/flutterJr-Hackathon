import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> loginWithPassword(
  String email,
  String password,
) async {
  try {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user != null) {
      return 'ok';
    }
  } on AuthException catch (error) {
    log('エラー：$error');
    return 'エラー';
  } on Exception catch (e) {
    log('エラー：$e');
    return 'エラー';
  }
  return '';
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:room_check/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(Ref ref) {
  return supabase;
}

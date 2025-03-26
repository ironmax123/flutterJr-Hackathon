// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:room_check/supabase/supabase.dart';

class LoginCheckPage extends HookWidget {
  const LoginCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isNavigated = useState(false);

    useEffect(() {
      if (!isNavigated.value) {
        final userId = user?.id;
        log('id:$userId');
        isNavigated.value = true;
        Future.microtask(() {
          if (userId != null) {
            context.go('/home');
          } else {
            context.go('/login');
          }
        });
      }
      return null;
    }, []);

    return const Scaffold(
      body: Center(
        child: Text('ログインチェック中...'),
      ),
    );
  }
}

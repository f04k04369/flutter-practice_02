import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'state.g.dart';

// Riverpodでサインイン関係の状態を管理する


// 
// FireabaseユーザーをAsyncValue型で管理するプロバイダー
// 
@riverpod
Stream<User?> userChanges(UserChangesRef ref) {
  // Firebaseからユーザーの変化をおしえてもらう
  return FirebaseAuth.instance.authStateChanges();
}

// 
// ユーザー
// 
@riverpod
User? user(UserRef ref) {
  final userChanges = ref.watch(userChangesProvider);
  return userChanges.when(
    loading: () => null,
    error: (e,s) => null,
    data: (d) => d,
  );
}

// 
// サインインしているかどうか
// 
@riverpod
bool signedIn(SignedInRef ref) {
  final user = ref.watch(userProvider);

  return user !=null;
}

// 
// ユーザーID
// 
@riverpod
String userId(UserIdRef ref) {
  throw 'スコープ内からしか使えません';
}

// 
// ユーザーIDスコープ
// 
class UserIdScope extends ConsumerWidget {
  const UserIdScope({
    super.key,
    required this.child
  
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // サインインしているユーザーの情報
    final user = ref.watch(userProvider);
    if (user == null) {
      // ユーザーが見つからないとき　ぐるぐる
      return const CircularProgressIndicator();
    } else {
      // ゆーざーが見つかった時

      return ProviderScope(
        // ユーザーIDを上書き
        overrides: [
          userIdProvider.overrideWithValue(user.uid),
        ],
        child: child,
      );
    }
  }
}

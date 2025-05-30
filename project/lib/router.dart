import 'package:flutter/material.dart';
import 'package:project/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:project/state.dart';
part 'router.g.dart';

// ページごとのパス　>>router/page_path.dart
class PagePath {
  static const signIn = '/sign-in';
  static const home = '/home';
}

// gorouterもriverpodで管理する
@riverpod
GoRouter router(RouterRef ref) {
  // パスと画面ウィジェットの組み合わせ
  final routes = [
    // サインイン画面
    GoRoute(
      path: PagePath.signIn,
      builder: (_, __) => const SignInPage(),
    ),

    // shellroute
    ShellRoute(
      builder: (_, __, child) => UserIdScope(child: child),
      routes: [
        // ホーム画面
        GoRoute(
          path: PagePath.home,
          builder: (_, __) => const HomePage(),
        ),
      ]
    ),
  ];

  // リダイレクト　強制的に画面を変更する 
  String? redirect(BuildContext context, GoRouterState state) {
    // 表示しようとしている画面
    final page = state.uri.toString();
    // サインインしているかどうか
    final signedIn = ref.read(signedInProvider);

    if (signedIn && page == PagePath.signIn) {
      // もうサインインしているのにサインイン画面を表示しようとしている--> ホーム画面へ
      return PagePath.home;
    } else if (!signedIn) {
      return PagePath.signIn;
    } else { 
      return null;
    }
  }

  // リフレッシュリスナブル - Riverpod と GoRouter を連動させるコード
  // サインイン状態が切り替わった時にGoRouterが反応する
  final listenable = ValueNotifier<Object?>(null);
  ref.listen<Object?>(signedInProvider, (_, newState){
    listenable.value = newState;
  });
  ref.onDispose(listenable.dispose);


  // GoRouterを作成
  return GoRouter(
    initialLocation: PagePath.signIn,
    routes: routes,
    redirect: redirect,
    refreshListenable: listenable
  );
}


// アプリ本体
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
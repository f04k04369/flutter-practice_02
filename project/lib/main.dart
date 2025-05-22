import 'package:flutter/material.dart';
import 'package:project/sideMenu.dart';

main() {
  // ウィジェット定義
  final appBar = AppBar(
    title: const Text('appBar'),
    backgroundColor: Colors.blue,
  );

  // ドロワー
  final drawer = Drawer(
    child: SideMenu(),
  );

  // エンドドロワー
  final endDrawer = Drawer(
    child: SideMenu(),
  );

  // フローティングアクションボタン
    final fab = FloatingActionButton(
      onPressed: () {
        debugPrint('アクションボタンが押されました');
      } ,
      child: const Text('FAB'),
    );

    // ボディ
    const body = Center(
      child: Text('bodyだよー'),
    );


  // 画面定義
  final scaffold = Scaffold(
    appBar: appBar,
    drawer: drawer,
    endDrawer: endDrawer,
    floatingActionButton: fab,
    body: body,
  );

  // アプリ
  final app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: scaffold,
  );
  runApp(app);
}

// アプリ全体

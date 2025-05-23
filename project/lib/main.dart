import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/page_a.dart';
import 'package:project/page_b.dart';
import 'package:project/page_c.dart';


// アプリ全体
main() {
  // アプリ
  const app = MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Root(),
  );
  const scope = ProviderScope(child: app);

  runApp(scope);
}

// プロバイダー
final indexProvider = StateProvider(
  (ref) {
// 変化させたいデータ
    return 0;
  },
);

// 画面全体を定義
class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)  {

    final index = ref.watch(indexProvider);

  // アイコン取得
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'アイテムA'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'アイテムB'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'アイテムC'
      ),

    ];

    // ボトムナビゲーションバーの設定
    final bar = BottomNavigationBar(
      items: items,
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      onTap: (index) {
        // タップされたときにインデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
    );

    // ウィジェット定義
    const pages = [
      pageA(),
      PageB(),
      PageC(),
    ];

    // 画面定義
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );
  }
}
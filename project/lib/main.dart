import 'package:flutter/material.dart';
import 'package:project/banana_counter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() {
  // アプリ
  const app = MaterialApp(home: Sample());

  // プロバイダースコープで囲む
  const scope = ProviderScope(child: app);

  // アプリを動かす
  runApp(scope);
}

final nicknameProvider = StateProvider<String>(
  (ref) {
    // 変化するデータ
    return "ルビードッグ";
  }
);

// 画面
class Sample extends ConsumerWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // データを見張っておく
    final nickname = ref.watch(nicknameProvider);

    return Scaffold(
      appBar: AppBar(title: Text(nickname)),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(nickname),
            ElevatedButton(onPressed: () => tapA(ref), child: Text('A')),
            ElevatedButton(onPressed: () => tapB(ref), child: Text('B')),
            ElevatedButton(onPressed: () => tapC(ref), child: Text('C')),
            Text(nickname),
          ],
        ),
      ),
    );
  }

// ノティファイアでデータを変更する

  tapA(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = "ルビーキャット";
  }

  tapB(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = "シャイニングフィンガー";
  }

  tapC(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = "ゴッドフィンガー";
  }
}
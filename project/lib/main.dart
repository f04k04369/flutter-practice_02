import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
final radioIdProvider = StateProvider<String?>(
  (ref) {
// 最初はどれも選ばれていないのでnull
    return null;
  },
);

// 選ばれたチェックボックスのIDたち
final checkdedIdsProvider = StateProvider<Set<String?>>(
  (ref) {
    return {};
  }
);

// 画面全体を定義
class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)  {

    // ラジオボタンIDに合わせて画面を変化
    final radioId = ref.watch(radioIdProvider);
    // チェックボックスIDたちに合わせて画面を変化
    final checkedIds = ref.watch(checkdedIdsProvider);
 
    // ラジオボタンを押された時の関数
    void onChangedRadio(String? id) {
      ref.read(radioIdProvider.notifier).state = id;
    }

    // チェックボックスを押された時の関数
    void onChangedCheckbox(String? id) {
      final newSet = Set.of(checkedIds);

      if (newSet.contains(id)) {
        // すでにチェックされていたら取り除く
        newSet.remove(id);
      } else {
        // まだチェックされていなければ追加
        newSet.add(id);
      }
      ref.read(checkdedIdsProvider.notifier).state = newSet;
    }

    // ボタンたちを定義する
    final col = Column(
      children: [
        RadioListTile(
          value: 'A', 
          groupValue: radioId, 
          onChanged: onChangedRadio,
          title: const Text('ラジオボタンA'),
        ),        RadioListTile(
          value: 'B', 
          groupValue: radioId, 
          onChanged: onChangedRadio,
          title: const Text('ラジオボタンB'),
        ),
        RadioListTile(
          value: 'C', 
          groupValue: radioId, 
          onChanged: onChangedRadio,
          title: const Text('ラジオボタンC'),
        ),
        CheckboxListTile(
          value: checkedIds.contains('A'), 
          onChanged: (check) => onChangedCheckbox('A'),
          title: const Text('チェックボックスA'),
        ),        CheckboxListTile(
          value: checkedIds.contains('B'), 
          onChanged: (check) => onChangedCheckbox('B'),
          title: const Text('チェックボックスB'),
        ),
        CheckboxListTile(
          value: checkedIds.contains('C'), 
          onChanged: (check) => onChangedCheckbox('C'),
          title: const Text('チェックボックスC'),
        ),


      ],
    );


    // 画面を返す
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            col,
            ElevatedButton(
              onPressed: () {
                debugPrint(radioId);
                debugPrint(checkedIds.toString());
              }, 
              child: const Text('OK')
            ),
          ],
        ),
      ),
    );
  }
}
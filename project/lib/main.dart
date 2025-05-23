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
final isOnProvider = StateProvider(
  (ref) {
// 変化させたいデータ
    return true;
  },
);

// スライダーの数値
final valueProvider = StateProvider((ref) {
  return 0.0;
});

// レンジスライダーの範囲
final rangeProvider = StateProvider((ref) {
  return const RangeValues(0.0, 1.0);
});

// 画面全体を定義
class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)  {

    // トグルスイッチ
    final isOn = ref.watch(isOnProvider);

    final toggleSwith = Switch(
      value: isOn,
      onChanged: (isOn) {
        ref.read(isOnProvider.notifier).state = isOn;
      },
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey,
    );

    // スライダー
    final value = ref.watch(valueProvider);
    final slider = Slider(
      value: value,
      onChanged: (value) {
        ref.read(valueProvider.notifier).state = value;
      },

      thumbColor: Colors.orange,
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    // 赤色のコンテナ
    final redBox = Container(
      color: Colors.red,
      height: 20,
      width: value * 300,
    );


    // レンジスライダー
    final range = ref.watch(rangeProvider);
    final rangeSlider = RangeSlider(
      values: range,
      onChanged: (range) {
        ref.read(rangeProvider.notifier).state = range;
      },

      activeColor: Colors.green,
      inactiveColor: Colors.grey,
    );

    // 画面を返す
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            toggleSwith,
            slider,
            rangeSlider,
            redBox,
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';


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

// どのくらい進んだかを表す　パーセント
final percentProvider = StateProvider(
  (ref) {
// 最初はどれも選ばれていないのでnull
    return 0.00;
  },
);


// 画面全体を定義
class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref)  {

    // パーセント
    final percent = ref.watch(percentProvider);

    // 丸形のインジケーター
    final circular = CircularPercentIndicator(
      percent: percent,
      backgroundColor: Colors.yellow,
      progressColor: Colors.green,
      radius: 60,
      lineWidth: 20,
      center: Text('${percent * 100}%'),
      animation: true,
      animationDuration: 200,
      animateFromLastPercent: true,
    );

    // 棒型のインジケーター
    final linear = LinearPercentIndicator(
      percent: percent,
      backgroundColor: Colors.black,
      progressColor: Colors.amber,
      alignment: MainAxisAlignment.center,
      lineHeight: 20,
      width: 300,      
      animation: true,
      animationDuration: 200,
      animateFromLastPercent: true,

    );

    final col  = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 40,
      children: [
        circular,
        linear,
      ],
    );

    // ボタンを押したときの関数
    void onPressed(WidgetRef ref) async{
      // 1秒間待つ
      await Future.delayed(const Duration(seconds: 1));
      ref.read(percentProvider.notifier).state = 0.20;
      // １秒待つ
      await Future.delayed(const Duration(seconds: 1));
      ref.read(percentProvider.notifier).state = 0.40;      
      // 1秒間待つ
      await Future.delayed(const Duration(seconds: 1));
      ref.read(percentProvider.notifier).state = 0.60;
      // １秒待つ
      await Future.delayed(const Duration(seconds: 1));
      ref.read(percentProvider.notifier).state = 0.80;      
      // １秒待つ
      await Future.delayed(const Duration(seconds: 1));
      ref.read(percentProvider.notifier).state = 1.00;
    }
 
    // 画面を返す
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            col,
            ElevatedButton(
              onPressed: () => {
                onPressed(ref),
              }, 
              child: const Text('スタート'),
            ),
          ],
        ),
      ),
    );
  }
}
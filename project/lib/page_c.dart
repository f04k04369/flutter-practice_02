import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageC extends StatelessWidget{
  const PageC({super.key});

  // 進むボタンを押したとき
  push(BuildContext context) {
  // 指定した画面へ進む
    context.push('/a');
  }

  back(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('画面C'),
    );

    final pushButton = ElevatedButton(
      onPressed: () => push(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('最初のページへ＞')
      );

          // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('戻る＞')
      );


    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton,
            pushButton,

          ],
        ),
      ),
    );
  }
}
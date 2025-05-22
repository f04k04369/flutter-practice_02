import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageB extends StatelessWidget{
  const PageB({super.key});

  // 進むボタンを押したとき
  push(BuildContext context) {
  // 指定した画面へ進む
    context.push('/c');
  }

  back(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('画面B'),
    );

    // 進むボタン
    final goButton = ElevatedButton(
      onPressed: () => push(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('進む＞')
      );

    // 戻るボタン
    final backButton = ElevatedButton(
      onPressed: () => back(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('戻る')
      );


    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            backButton,
            goButton,
          ],
        ),
      ),
    );
  }
}
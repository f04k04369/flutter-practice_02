import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageA extends StatelessWidget{
  const PageA({super.key});

  // 進むボタンを押したとき
  push(BuildContext context) {
    context.push('/b');
  }
  // 指定した画面へ進む

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: const Text('画面A'),
    );

    final pushButton = ElevatedButton(
      onPressed: () => push(context),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: const Text('進む＞')
      );

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pushButton
          ],
        ),
      ),
    );
  }
}
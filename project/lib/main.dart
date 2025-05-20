import 'package:flutter/material.dart';
import 'package:project/banana_counter.dart';

void main() {

  final controller = TextEditingController();

  final textField = TextField(
    controller: controller,

    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'あなたのなまえ',
      hintText: 'カタカナで入力してください',
      errorText: '名前が長すぎます',
    ),
  );

  zzzz() {
    debugPrint( controller.text );
  }

  final button = ElevatedButton(onPressed: zzzz, child: const Text('ボタン'));

  // xxxx() {
  //   debugPrint('これから通信を始めます');
  // }

  // final button = ElevatedButton(
  //   onPressed: xxxx, 
  //   child: Text('おしてみて') ,

  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: Colors.green,
  //   ),
  //   );

  // final bananaCounter = BananaCounter(
  //   number: 888,

  // );

  // final col = Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   crossAxisAlignment: CrossAxisAlignment.center,
  //   children: const [
  //     Text('レモン'),
  //     Text('リンゴ'),
  //     Text('ブドウ'),
  //   ],
  // );

  // final img = Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   crossAxisAlignment: CrossAxisAlignment.center,
  //   children: [
  //     Image.asset(
  //       'assets/images/saku.png'
  //       ),
  //     Image.network(
  //       'https://flutter-image-network.web.app/inu.jpeg'
  //     )
  //   ],
  // );

  // final con = Container(
  //   color: Colors.deepOrange,
  //   width: 500,
  //   height: 400,
  //   child: col,
  //   alignment: Alignment.centerLeft,
  //   padding: EdgeInsets.fromLTRB(20,10,0,100),
  //   margin: EdgeInsets.all(20),
  // );

  // final rowItems = Row(
  //   mainAxisSize: MainAxisSize.min,
  //   children: [
  //     col, col, col
  //   ],
  // );

  // final colItems = Column(
  //   mainAxisSize: MainAxisSize.min,
  //   children: [
  //     col, col, col
  //   ],
  // );

  final a = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              child: textField,
            ),
            button
          ],
        ),
      ),
    ),
  );
  runApp(a);
}
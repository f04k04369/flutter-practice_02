import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  // ホーム画面
  const home = Home();
  // アプリ
  const app = MaterialApp(home: home);
  runApp(app);
}

// 馬のモデルクラス
class Horse {
  // 名前
  final String name;
  // アイコン画像
  final String iconUri;
  // コンストラクタ
  Horse(this.name, this.iconUri);
}

/// カードにしたいモデルたち
final models = [
  Horse('ナリタブライアン', 'saku.png'),
  Horse('スペシャルウィーク', 'saku.png'),
  Horse('オグリキャップ', 'saku.png'),
  Horse('サイレンススズカ', 'saku.png'),
  Horse('トウカイテイオー', 'saku.png'),
];

// 馬のカードウィジェット
class HorseCard extends StatelessWidget {
  const HorseCard({
    super.key,
    required this.model,
  });
// データが入ったモデル
final Horse model;

@override
  Widget build(BuildContext context) {
    // 画像
    final img = SizedBox(
      height: 100,
      child: Image.asset(
        'asset/images/${model.iconUri}',
      ),
    );

    // 名前
    final text = Text(
      model.name,
      style: const TextStyle(fontSize: 20),
    );

    // 画像と名前を縦に並べる
    final imgAndText = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        img,
        text
      ],
    );

    // カード部分を作るコンテナ
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          )
        ]
      ),
      child: imgAndText,
    );
  }
}

// モデル => ウィジェットに変換する関数
Widget modelToWidget(Horse model) {
  // ページ部分
  return Container(
    // カードの周りに10ずつスペースを開ける
    padding:  const EdgeInsets.all(10),
    // 中身はカード
    child: HorseCard(model: model),
  );
}

// ホーム画面
class Home extends StatelessWidget { 
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 画面

    final carousel = PageView.builder(
      // カルーセルのコントローラー
      controller: PageController(
        viewportFraction: 0.6
      ),
      // カードの数　＝　モデル数
      itemCount: models.length,
      // モデルをウィジェットに変換する関数
      itemBuilder: (c, i) =>  modelToWidget(models[i]),
    );

    return Scaffold(
      body: Center(
        // 横長のコンテナ
        child: Container(
          height: 200,
          color: Colors.grey,
          child: carousel
        ),
      ),
    );
  }
}
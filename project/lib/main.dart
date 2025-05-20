import 'package:flutter/material.dart';

// ツイート
class Tweet {
  // ユーザーの名前
  final String userName;
  // アイコンの画像
  final String iconUrl;
  // 文章メッセージ
  final String text;
  // 送信日時
  final String createdAt;

  // コンストラクタ
  Tweet(this.userName, this.iconUrl, this.text, this.createdAt);
}


// 適当なモデル
final models = [
  Tweet('ルフィ', 'saku.png', '海賊王におれはなる！', '2022/1/1'),
  Tweet('ゾロ', 'saku.png', 'おれはもう！二度と敗けねェから！', '2022/1/2'),
  Tweet('ナミ', 'saku.png', 'もう背中向けられないじゃないっ！', '2022/1/3'),
  Tweet('ウソップ', 'saku.png', 'お前らの”伝説のヒーロー”になってやる！', '2022/1/4'),
  Tweet('サンジ', 'saku.png', 'たとえ死んでもおれは女は蹴らん・・・！', '2022/1/5'),
  Tweet('チョッパー', 'saku.png', '人間ならもっと自由だ！', '2022/1/6'),
  Tweet('ビビ', 'saku.png', 'もう一度仲間と呼んでくれますか!?', '2022/1/7'),
  Tweet('ロビン', 'saku.png', '生ぎたいっ！', '2022/1/8'),
  Tweet('フランキー', 'saku.png', '存在することは罪にはならねェ！', '2022/1/9'),
  Tweet('ブルック', 'saku.png', '男が一度・・・必ず帰ると言ったのだから！', '2022/1/10'),
  Tweet('ジンベイ', 'saku.png', '失ったものばかり数えるな！', '2022/1/11'),
  Tweet('シャンクス', 'saku.png', 'この帽子をお前に預ける', '2022/2/1'),
  Tweet('ヒルルク', 'saku.png', '違う!…人に忘れられた時さ…!', '2022/2/2'),
  Tweet('ドクタークレハ', 'saku.png', '優しいだけじゃ人は救えないんだ!', '2022/2/3'),
  Tweet('ティーチ', 'saku.png', '人の夢は!終わらねェ!', '2022/2/4'),
  Tweet('ガンフォール', 'saku.png', '人の生きるこの世界に“神”などおらぬ!', '2022/2/5'),
  Tweet('ボンクレー', 'saku.png', '理由なんざ他にゃいらねェ!', '2022/2/6'),
  Tweet('イワンコフ', 'saku.png', '“奇跡”ナメるんじゃないよォ!', '2022/2/7'),
  Tweet('ニューゲート', 'saku.png', 'バカな息子をそれでも愛そう・・・', '2022/1/8'),
  Tweet('エース', 'saku.png', '愛してくれて・・・ありがとう', '2022/2/9'),
  Tweet('ロー', 'saku.png', '取るべきイスは…必ず奪う!', '2022/2/10'),
  Tweet('サボ', 'saku.png', '以後ルフィのバックにはおれがついてる!', '2022/2/11'),
  Tweet('バルトロメオ', 'saku.png', 'この子分盃!勝手に頂戴いたしますだべ!', '2022/3/1'),
];

// モデル　=>　ウィジェットに変換する
Widget modelToWidget(Tweet model) {
  // ユーザーアイコン
  final icon = Container(
    margin: const EdgeInsets.all(20),
    width: 60,
    height: 60,
    // 画像を丸くする
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('assets/images/${model.iconUrl}'),
    ),
  );

  // 名前と時間
  final metaText = Container(
    padding: const EdgeInsets.all(6),
    height: 40,
    alignment: Alignment.centerLeft,
    child: Text(
      '${model.userName}  ${model.createdAt}',
      style: const TextStyle(
        fontWeight:
         FontWeight.bold,
         fontSize: 12,
      ),
    ),
  );

  // 本文
  final text = Container(
    padding: const EdgeInsets.all(8),
    alignment: Alignment.centerLeft,
    child: Text(
      '${model.text}',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
  );

  // 部品を並べる
  return Container(
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      color: Colors.white,
    ),
    width: double.infinity,
    height: 120,
    child: Row(
      children: [
        icon,
        Expanded(
          child: Column(
            children: [
              metaText,
              text,
            ],
          ) 
        ),
      ],
    ),
  );
}


void main() {
  // 画面
  final list = ListView.builder(
    itemCount: models.length,
    itemBuilder: (c,i) => modelToWidget(models[i]),
  );

  final con = Center(
    child: SizedBox(
      height: 400,
      child: list,
    ),
  );

  final sca = Scaffold(body: con);


  // アプリ
  final app = MaterialApp(home: con);

  // アプリを動かす
  runApp(app);
}
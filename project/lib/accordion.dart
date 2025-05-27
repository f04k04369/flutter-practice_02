import 'package:flutter/material.dart';

// アコーディオン（オリジナルウィジェット）
class Accordion extends StatelessWidget {
  // ウィジェットのコンストラクターはconstをつけておく
  const Accordion({
    super.key,
    required this.headColor,
    required this.bodyColor,
    required this.title,
    required this.imageName,
  });

  // 知りたい情報たちにはfinalをつけておく

  final Color headColor;
  final Color bodyColor;
  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    // ExpansionTileウィジェットをつかってアコーディオンを作る
    return ExpansionTile(
      // 閉じたときの文字色
      collapsedTextColor: Colors.white,
      // 開いた時の文字色
      textColor: Colors.white,
      // 閉じたときのアイコン
      collapsedIconColor: Colors.white,
      // 開いた時のアイコンの色
      iconColor: Colors.white,
      // 閉じたときの背景食
      collapsedBackgroundColor: headColor,
      // 開いた時の背景色
      backgroundColor: headColor,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      children: [
        Container(
          color: bodyColor,
          width: double.infinity,
          height: 100,
          alignment: Alignment.center,
          child: Image.asset(imageName),
        )
      ],
    );
    
  }
}
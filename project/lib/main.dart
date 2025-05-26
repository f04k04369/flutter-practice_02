import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/pack.dart';
import 'package:project/recipe.dart';
import 'package:project/vegetable.dart';
import 'package:project/pack.dart';

void main() {
  // ホーム画面
  test6();
  const home = Home();
  // アプリ
  const app = MaterialApp(home: home);
  runApp(app);
}


// レベル１（JSONを受け取る）
void test1() async{
  // stubをつかえるようにする
  WidgetsFlutterBinding.ensureInitialized();

  // Json <-----Stub
  final json = await rootBundle.loadString('assets/stub/level1.json');

  // JsonMap <----JSON
  final map = jsonDecode(json);

  // 野菜でーた　<---- JsonMap
  final data = Vegetable.fromJson(map);
  debugPrint('データの中身は $data');
}

// レベル１（JSONを送る）
void test2() async{
  // 適当な野菜のデータ
  const data = Vegetable(
    name: "キャベツ",
    color: "緑",
    season: "春"
  );

    // JsonMap <----- 野菜データ
    final map = data.toJson();

    // JSON <----JsonMap
    final json = jsonEncode(map);
    // JSONの中身を確認する
    debugPrint('JSONの中身は${json}');
  
}

// レベル２（JSONを受け取る）
void test3() async{
  // stubをつかえるようにする
  WidgetsFlutterBinding.ensureInitialized();

  // Json <-----Stub
  final json = await rootBundle.loadString('assets/stub/level2.json');

  // JsonMap <----JSON
  final map = jsonDecode(json);

  // 野菜でーた　<---- JsonMap
  final data = Pack.fromJson(map);
  debugPrint('データの中身は $data');
}

// レベル２（JSONを送る）
void test4() async{
  // 適当な野菜のデータ
  const content = Vegetable(
    name: "ゴリラ",
    color: "黒色",
    season: "年がら年中"
  );
  // やさいぱっくのでーた　
  const data = Pack(
    size: '特大', 
    price: 2000000, 
    content: content
  );
  // JsonMap <----- 野菜データ
  final map = data.toJson();

  // JSON <----JsonMap
  final json = jsonEncode(map);
  // JSONの中身を確認する
  debugPrint('JSONの中身は${json}');

}

// レベル３（JSONを受け取る）
void test5() async{
    // stubをつかえるようにする
  WidgetsFlutterBinding.ensureInitialized();

  // Json <-----Stub
  final json = await rootBundle.loadString('assets/stub/level3.json');

  // JsonMap <----JSON
  final map = jsonDecode(json);

  // 野菜でーた　<---- JsonMap
  final data = Recipe.fromJson(map);
  debugPrint('データの中身は $data');
}

// レベル３（JSONを送る）
void test6() async{
  // 適当な野菜のデータ
  const vegetables = [
    Vegetable(
      name: "ライオン",
      color: "黒色",
      season: "年中"
    ),
    Vegetable(
      name: "トマト",
      color: "赤色",
      season: "年中"
    ),
    Vegetable(
      name: "ジャガイモ",
      color: "白",
      season: "年中"
    ),
  ];
  // レシピのでーた　
  const data = Recipe(
    title: '特大', 
    calories: 2000000, 
    vegetables: vegetables
  );
  // JsonMap <----- 野菜データ
  final map = data.toJson();

  // JSON <----JsonMap
  final json = jsonEncode(map);
  // JSONの中身を確認する
  debugPrint('JSONの中身は${json}');


}

// ホーム画面
class Home extends StatelessWidget { 
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // 画面

    return Scaffold(
      body: Center(
        // 横長のコンテナ
        child: Container(
        ),
      ),
    );
  }
}
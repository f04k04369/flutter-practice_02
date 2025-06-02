import 'package:flutter/material.dart';
import 'package:project/season_dropdown.dart';
import 'package:project/season.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/season_flower.dart';
import 'package:project/season_time.dart';

void main() {
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

// アプリ本体
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SeasonDropdown(),
            SeasonTime(),
            SeasonFlower()
          ],
        ),

      ),
    );
  }
}
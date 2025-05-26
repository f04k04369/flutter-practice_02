import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  // ホーム画面
  const app = MyApp();
  // アプリ
  runApp(app);
}


// アプリ本体
class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HomePage(),
    );
  }
}

// ホーム画面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            "バナナとーっても大好き！",
            style: GoogleFonts.hachiMaruPop(
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
  }
}

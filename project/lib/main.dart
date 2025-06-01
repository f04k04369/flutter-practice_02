import 'dart:convert';
import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/accordion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/service.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:project/pages.dart';
import 'package:project/router.dart';
import 'package:project/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/screen_pod.dart';

void main() async {
  // Firebase の準備
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // アプリを動かす
  const app = MyAppResponsive();
  // Riverpodと一緒に使うときはこう
  const scope = ProviderScope(child: app);
  // webで動いているかどうか
  if (kIsWeb) {
    // デバイスプレビューで囲む
    final devicePreview = DevicePreview(builder: (_) => scope);
    runApp(devicePreview);
  } else {
    runApp(scope);
  }
}

// ホーム画面
class MyAppResponsive extends StatelessWidget {
  const MyAppResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    // watch
    final screen = ScreenRef(context).watch(screenProvider);

    String text1;
    if (screen.sizeClass == ScreenSizeClass.phone) {
      text1 = 'これはスマホサイズです';
    } else {
      text1 = 'これはスマホサイズではありません';
    }

    String text2;
    if (screen.orientation == Orientation.portrait) {
      text2 = 'これは縦向きです';
    } else {
      text2 = 'これは縦向きではありません';
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 文字 1
            Text(
              text1,
              style: const TextStyle(fontSize: 20),
            ),
            // 文字 2
            Text(
              text2,
              style: const TextStyle(fontSize: 20),
            ),
            // 色付きコンテナ
            Container(
              color: Colors.orange,
              width: screen.designW(200), // 画面サイズによって変わる大きさ
              height: screen.designH(100),
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/accordion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/service.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


void main () async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  const flavor = String.fromEnvironment('flavor');

  if(flavor == 'dev') {
    // ここはdevのときだけ
  }

    if(flavor == 'stg') {
    // ここはstgのときだけ
  }

  if(flavor == 'prd') {
    // ここはprdのときだけ
    debugPrint('これはprdだよ');
  }


  // OFL を守るために このコードが必要
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString(
      'google_fonts/OFL.txt',
    );
    yield LicenseEntryWithLineBreaks(
      ['google_fonts'],
      license,
    );
  });

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
    final column = Column(
      children: [
        // さくアコーディオン
        Accordion(
          headColor: Colors.orange, 
          bodyColor: Colors.orange.shade200, 
          title: 'バナナ', 
          imageName: 'assets/images/saku.png'
        ),

        Accordion(
          headColor: Colors.red, 
          bodyColor: Colors.red.shade200, 
          title: 'リンゴ', 
          imageName: 'assets/images/saku.png'
        ),
        Accordion(
          headColor: Colors.green, 
          bodyColor: Colors.green.shade200, 
          title: 'めろん', 
          imageName: 'assets/images/saku.png'
        ),
        Accordion(
          headColor: Colors.purple, 
          bodyColor: Colors.purple.shade200, 
          title: 'ブドウ', 
          imageName: 'assets/images/saku.png'
        ),
        ElevatedButton(
          onPressed:  () {
              // Firebase アナリティクスを使うコード 2
              FirebaseAnalytics.instance.logEvent(
                name: 'ボタンが押されました',
              ); 
          },
          child: const Text('アナリティクス計測ボタン'),
        ),
        ElevatedButton(
          onPressed:  () async{
              // サービスクラスを呼び出す
              final service = AuthService();
              await service.signIn();
          },
          child: const Text('サインイン'),
        ),
      ],
    );
    
    // 画面
    return Scaffold(
        body: SingleChildScrollView(
          child: column,
        ),
      );
  }
}

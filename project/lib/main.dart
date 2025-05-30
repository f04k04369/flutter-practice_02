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
import 'package:project/pages.dart';
import 'package:project/router.dart';
import 'package:project/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Firebase の準備
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // アプリを動かす
  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}
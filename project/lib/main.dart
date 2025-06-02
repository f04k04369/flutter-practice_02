import 'package:flutter/material.dart';
import 'package:project/lemon_dialog.dart';
import 'package:project/pineapple_dialog.dart';

// Stack, Positioned, Align の練習

void main() {
  const app = MyApp();
  runApp(app);
}

// アプリ
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage()
  );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final answer = await showDialog(
              context: context, 
              builder: (_) => const LemonDialog()
            );

            debugPrint(answer);

            if(!context.mounted) return;
            showDialog(
              context: context, 
              builder: (_) => const PineappleDialog(),
            );
          }, 
          child: const Text('開く'),
        ),
      ),
    );
  }
}
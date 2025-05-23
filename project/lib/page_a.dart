import 'package:flutter/material.dart';

class pageA extends StatelessWidget {
  const pageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: const Center(
        child: Text('画面A'),
      ),
    );
  }
}
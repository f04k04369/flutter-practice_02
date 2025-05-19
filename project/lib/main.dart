import 'package:flutter/material.dart';

void main() {

  final col = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      Text('レモン'),
      Text('リンゴ'),
      Text('ブドウ'),
    ],
  );

  final row = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      col, col, col
    ],
  );

  final a = MaterialApp(
    home: Scaffold(
      body: Center(
        child: row,
      ),
    ),
  );
  runApp(a);
}
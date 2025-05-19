import 'package:flutter/material.dart';

void main() {

  final col = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        'assets/images/saku.png'
        ),
      Image.network(
        'https://flutter-image-network.web.app/inu.jpeg'
      )
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
        child: col,
      ),
    ),
  );
  runApp(a);
}
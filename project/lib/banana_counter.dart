import 'package:flutter/material.dart';

class BananaCounter extends StatelessWidget {
    final int number;
  const BananaCounter({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    // バナナの画像
    final saku = Image.asset('assets/images/saku.png');

    final text = Text(
      '$number',
      style: const TextStyle(
        color: Colors.yellow,
        fontSize: 60,
      ),
      );

    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      SizedBox(
        width: 80,
        height: 80,
        child: saku,
      ),
      text,
    ],
    );

    final con = Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: row,
    );

    return con;
  }
}
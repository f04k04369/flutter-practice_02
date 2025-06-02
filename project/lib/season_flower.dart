import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/season.dart';

class SeasonFlower extends ConsumerWidget {
  const SeasonFlower({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final season = ref.watch(seasonNotifierProvider);

    return Image.asset(
      switch (season) {
        Season.spring => 'assets/images/saku.png',
        Season.summer => 'assets/images/saku.png',
        Season.autumn => 'assets/images/saku.png',
        Season.winter => 'assets/images/saku.png',        
      }
    );
  }
}
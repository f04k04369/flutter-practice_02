import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/season.dart';

class SeasonTime extends ConsumerWidget {
  const SeasonTime({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // 選択中の季節を監視
    final season = ref.watch(seasonNotifierProvider);

    return Text(
      switch (season) {
        Season.spring => 'あけぼの',
        Season.summer => 'よる',
        Season.autumn => 'ゆうぐれ',
        Season.winter => 'つとめて',
      }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/season.dart';

class SeasonDropdown extends ConsumerWidget {
  const SeasonDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 今の季節
    final season = ref.watch(seasonNotifierProvider);

    // 選択し
    final items = [
      DropdownMenuItem(
        value: Season.spring,
        child: Text('ハル'),
      ),
      DropdownMenuItem(
        value: Season.summer,
        child: Text('ナツ'),
      ),
      DropdownMenuItem(
        value: Season.autumn,
        child: Text('アキ'),
      ),
      DropdownMenuItem(
        value: Season.winter,
        child: Text('フユ'),
      ),
    ];

    // ドロップダウン本体
    return DropdownButton(
      value: season, 
      items: items,
      onChanged: (newSeason) {
        final notifier = ref.read(seasonNotifierProvider.notifier);
        notifier.updateSeason(newSeason!);
      },
    );
  }
}
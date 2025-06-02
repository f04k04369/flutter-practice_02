import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'season.g.dart';

// 季節
enum Season {
  spring,
  summer,
  autumn,
  winter,
}

/// 季節を状態管理
@riverpod
class SeasonNotifier extends _$SeasonNotifier {
  @override
  Season build() {
    // 春からスタート
    return Season.spring;
  }

  /// 季節を変更する
  void updateSeason(Season season) {
    state = season;
  }
}
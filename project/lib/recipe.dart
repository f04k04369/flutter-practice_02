import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project/vegetable.dart';
part 'recipe.freezed.dart';
part 'recipe.g.dart';

// レベル3ただの料理レシピ
@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    // 大きさ
    required String title,
    // 値段
    required int calories,
    // 中身の野菜
    required List<Vegetable> vegetables ,
  }) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) =>
    _$RecipeFromJson(json);
}
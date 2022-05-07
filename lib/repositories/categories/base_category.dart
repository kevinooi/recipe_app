import '../../model/category_model.dart';
import '../../model/drink_category_model.dart';

abstract class BaseCategoryRepository {
  Future<List<Category>> getFoodCategories() async => [];

  Future<List<DrinkCategory>> getDrinkCategories(String strCategory) async =>
      [];
}

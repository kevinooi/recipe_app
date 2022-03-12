import 'package:astro_flutter/model/category_model.dart';
import 'package:astro_flutter/model/drink_category_model.dart';
import 'package:astro_flutter/repositories/repositories.dart';

class MockCategoryRepository extends BaseCategoryRepository {
  @override
  Future<List<Category>> getFoodCategories() async =>
      await Future.value(mockFoodCategories);

  @override
  Future<List<DrinkCategory>> getDrinkCategories(String strCategory) async =>
      await Future.value(mockDrinkCategories);
}

const mockFoodCategories = [
  Category(
    idCategory: '1',
    strCategory: 'Food Category 1',
    strCategoryThumb: 'https://picsum.photos/id/488/80/80',
    strCategoryDescription: 'Food Category 1 description',
  ),
  Category(
    idCategory: '2',
    strCategory: 'Food Category 2',
    strCategoryThumb: 'https://picsum.photos/id/488/80/80',
    strCategoryDescription: 'Food Category 2 description',
  ),
];

const mockDrinkCategories = [
  DrinkCategory(
    idDrink: '1',
    strDrink: 'Drink Category 1',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
  ),
  DrinkCategory(
    idDrink: '2',
    strDrink: 'Drink Category 2',
    strDrinkThumb: 'https://picsum.photos/id/431/80/80',
  ),
];

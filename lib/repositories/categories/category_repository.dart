import 'dart:convert';

import '../../config/extensions.dart';
import 'package:http/http.dart' as http;

import '../../model/category_model.dart';
import 'base_category.dart';
import '../../model/drink_category_model.dart';

class CategoryRepository extends BaseCategoryRepository {
  CategoryRepository();

  @override
  Future<List<Category>> getFoodCategories() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
      );
      logI('food categories response', response);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final castList = data['categories'] as List<dynamic>?;

        if (castList != null) {
          return castList.map((category) {
            return Category.fromJson(category);
          }).toList();
        }
      }
      return [];
    } catch (e, stackTrace) {
      logE('category', e.toString(), stackTrace);
      throw Exception('error fetching categories: $e $stackTrace');
    }
  }

  @override
  Future<List<DrinkCategory>> getDrinkCategories(String strCategory) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$strCategory'),
      );
      logI('drink categories response', response);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final castList = data['drinks'] as List<dynamic>?;

        if (castList != null) {
          return castList.map((drinkCategory) {
            return DrinkCategory.fromJson(drinkCategory);
          }).toList();
        }
      }
      return [];
    } catch (e, stackTrace) {
      logE('DrinkCategories', e.toString(), stackTrace);
      throw Exception('error fetching drink categories: $e $stackTrace');
    }
  }
}

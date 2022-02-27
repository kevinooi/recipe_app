import 'dart:convert';

import 'package:astro_flutter/config/extensions.dart';
import 'package:http/http.dart' as http;

import 'package:astro_flutter/model/category_model.dart';
import 'package:astro_flutter/repositories/categories/base_category.dart';

class CategoryRepository extends BaseCategoryRepository {
  CategoryRepository();

  @override
  Future<List<Category>?> getAllCategories() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
      );
      logI('response', response);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['categories'] as List<dynamic>).map((category) {
          return Category.fromJson(category);
        }).toList();
      }
      return null;
    } catch (e, stackTrace) {
      logE('category', e.toString(), stackTrace);
      throw Exception('error fetching categories: $e $stackTrace');
    }
  }
}

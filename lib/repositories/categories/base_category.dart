import 'package:astro_flutter/model/category_model.dart';

abstract class BaseCategoryRepository {
  Future<List<Category>?> getAllCategories() async {}
}

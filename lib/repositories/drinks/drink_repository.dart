import 'dart:convert';

import 'package:astro_flutter/config/extensions.dart';
import 'package:astro_flutter/model/drink_model.dart';
import 'package:astro_flutter/repositories/drinks/base_drink.dart';
import 'package:http/http.dart' as http;

class DrinkRepository extends BaseDrinkRepository {
  DrinkRepository();

  @override
  Future<List<Drink>> getDrinksByCategory(String strDrink) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$strDrink'),
      );
      logI('drinks response', response);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final castList = data['drinks'] as List<dynamic>?;

        if (castList != null) {
          return castList.map((drink) {
            return Drink.fromJson(drink);
          }).toList();
        }
      }
      return [];
    } catch (e, stackTrace) {
      logE('Drinks', e.toString(), stackTrace);
      throw Exception('error fetching drinks: $e $stackTrace');
    }
  }
}

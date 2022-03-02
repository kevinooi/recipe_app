import '../drink_model.dart';
import '../meal_model.dart';

class Detail {
  final Meal? meal;
  final Drink? drink;

  const Detail({
    this.meal,
    this.drink,
  });
}

class Ingredient {
  final String ingredient;
  final String measurement;

  const Ingredient({
    this.ingredient = '',
    this.measurement = '',
  });
}

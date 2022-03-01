import '../../model/meal_model.dart';
import 'base_meal.dart';

const mockMeals = [
  Meal(
    idMeal: '1',
    strMealThumb: 'https://picsum.photos/id/488/80/80',
    strMeal: 'Meal 1',
    strCategory: 'Meal 1 Category',
    strArea: 'Meal 1 Area',
  ),
  Meal(
    idMeal: '2',
    strMealThumb: 'https://picsum.photos/id/488/80/80',
    strMeal: 'Meal 2',
    strCategory: 'Meal 2 Category',
    strArea: 'Meal 2 Area',
  ),
];

class MockMealRepository extends BaseMealRepository {
  @override
  Future<List<Meal>> getMealsByCategory(String strCategory) async =>
      Future.delayed(const Duration(seconds: 2), () => [...mockMeals]);
}

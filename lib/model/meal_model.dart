import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

@JsonSerializable()
@CopyWith()
class Meal extends Equatable {
  final String? idMeal;
  final String? strMeal;
  final String? strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final DateTime? dateModified;

  const Meal({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  List<Object?> get props => [
        idMeal,
        strMeal,
        strDrinkAlternate,
        strCategory,
        strArea,
        strInstructions,
        strMealThumb,
        strTags,
        strYoutube,
        strIngredient1,
        strIngredient2,
        strIngredient3,
        strIngredient4,
        strIngredient5,
        strIngredient6,
        strIngredient7,
        strIngredient8,
        strIngredient9,
        strIngredient10,
        strIngredient11,
        strIngredient12,
        strIngredient13,
        strIngredient14,
        strIngredient15,
        strIngredient16,
        strIngredient17,
        strIngredient18,
        strIngredient19,
        strIngredient20,
        strMeasure1,
        strMeasure2,
        strMeasure3,
        strMeasure4,
        strMeasure5,
        strMeasure6,
        strMeasure7,
        strMeasure8,
        strMeasure9,
        strMeasure10,
        strMeasure11,
        strMeasure12,
        strMeasure13,
        strMeasure14,
        strMeasure15,
        strMeasure16,
        strMeasure17,
        strMeasure18,
        strMeasure19,
        strMeasure20,
        strSource,
        strImageSource,
        strCreativeCommonsConfirmed,
        dateModified,
      ];

  List<String> get ingredients {
    List<String> results = [];

    if (strIngredient1?.isNotEmpty ?? false) results.add(strIngredient1!);
    if (strIngredient2?.isNotEmpty ?? false) results.add(strIngredient2!);
    if (strIngredient3?.isNotEmpty ?? false) results.add(strIngredient3!);
    if (strIngredient4?.isNotEmpty ?? false) results.add(strIngredient4!);
    if (strIngredient5?.isNotEmpty ?? false) results.add(strIngredient5!);
    if (strIngredient6?.isNotEmpty ?? false) results.add(strIngredient6!);
    if (strIngredient7?.isNotEmpty ?? false) results.add(strIngredient7!);
    if (strIngredient8?.isNotEmpty ?? false) results.add(strIngredient8!);
    if (strIngredient9?.isNotEmpty ?? false) results.add(strIngredient9!);
    if (strIngredient10?.isNotEmpty ?? false) results.add(strIngredient10!);
    if (strIngredient11?.isNotEmpty ?? false) results.add(strIngredient11!);
    if (strIngredient12?.isNotEmpty ?? false) results.add(strIngredient12!);
    if (strIngredient13?.isNotEmpty ?? false) results.add(strIngredient13!);
    if (strIngredient14?.isNotEmpty ?? false) results.add(strIngredient14!);
    if (strIngredient15?.isNotEmpty ?? false) results.add(strIngredient15!);
    if (strIngredient16?.isNotEmpty ?? false) results.add(strIngredient16!);
    if (strIngredient17?.isNotEmpty ?? false) results.add(strIngredient17!);
    if (strIngredient18?.isNotEmpty ?? false) results.add(strIngredient18!);
    if (strIngredient19?.isNotEmpty ?? false) results.add(strIngredient19!);
    if (strIngredient20?.isNotEmpty ?? false) results.add(strIngredient20!);

    return results;
  }

  List<String> get measures {
    List<String> results = [];

    if (strMeasure1?.isNotEmpty ?? false) results.add(strMeasure1!);
    if (strMeasure2?.isNotEmpty ?? false) results.add(strMeasure2!);
    if (strMeasure3?.isNotEmpty ?? false) results.add(strMeasure3!);
    if (strMeasure4?.isNotEmpty ?? false) results.add(strMeasure4!);
    if (strMeasure5?.isNotEmpty ?? false) results.add(strMeasure5!);
    if (strMeasure6?.isNotEmpty ?? false) results.add(strMeasure6!);
    if (strMeasure7?.isNotEmpty ?? false) results.add(strMeasure7!);
    if (strMeasure8?.isNotEmpty ?? false) results.add(strMeasure8!);
    if (strMeasure9?.isNotEmpty ?? false) results.add(strMeasure9!);
    if (strMeasure10?.isNotEmpty ?? false) results.add(strMeasure10!);
    if (strMeasure11?.isNotEmpty ?? false) results.add(strMeasure11!);
    if (strMeasure12?.isNotEmpty ?? false) results.add(strMeasure12!);
    if (strMeasure13?.isNotEmpty ?? false) results.add(strMeasure13!);
    if (strMeasure14?.isNotEmpty ?? false) results.add(strMeasure14!);
    if (strMeasure15?.isNotEmpty ?? false) results.add(strMeasure15!);
    if (strMeasure16?.isNotEmpty ?? false) results.add(strMeasure16!);
    if (strMeasure17?.isNotEmpty ?? false) results.add(strMeasure17!);
    if (strMeasure18?.isNotEmpty ?? false) results.add(strMeasure18!);
    if (strMeasure19?.isNotEmpty ?? false) results.add(strMeasure19!);
    if (strMeasure20?.isNotEmpty ?? false) results.add(strMeasure20!);

    return results;
  }

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}

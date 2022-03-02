import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import "package:collection/collection.dart";

import 'local/detail_model.dart';

part 'drink_model.g.dart';

@JsonSerializable()
@CopyWith()
class Drink extends Equatable {
  final String? idDrink;
  final String? strDrink;
  final String? strDrinkAlternate;
  final String? strTags;
  final String? strVideo;
  final String? strCategory;
  final String? strIBA;
  final String? strAlcoholic;
  final String? strGlass;
  final String? strInstructions;
  final String? strInstructionsES;
  final String? strInstructionsDE;
  final String? strInstructionsFR;
  final String? strInstructionsIT;
  final String? strInstructionsZHHANS;
  final String? strInstructionsZHHANT;
  final String? strDrinkThumb;
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
  final String? strImageSource;
  final String? strImageAttribution;
  final String? strCreativeCommonsConfirmed;
  final DateTime? dateModified;

  const Drink({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsFR,
    this.strInstructionsIT,
    this.strInstructionsZHHANS,
    this.strInstructionsZHHANT,
    this.strDrinkThumb,
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
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  List<Object?> get props => [
        idDrink,
        strDrink,
        strDrinkAlternate,
        strTags,
        strVideo,
        strCategory,
        strIBA,
        strAlcoholic,
        strGlass,
        strInstructions,
        strInstructionsES,
        strInstructionsDE,
        strInstructionsFR,
        strInstructionsIT,
        strInstructionsZHHANS,
        strInstructionsZHHANT,
        strDrinkThumb,
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
        strImageSource,
        strImageAttribution,
        strCreativeCommonsConfirmed,
        dateModified,
      ];

  List<String> get ingredients {
    List<String> result = [];
    result.addAll([
      strIngredient1 ?? '',
      strIngredient2 ?? '',
      strIngredient3 ?? '',
      strIngredient4 ?? '',
      strIngredient5 ?? '',
      strIngredient6 ?? '',
      strIngredient7 ?? '',
      strIngredient8 ?? '',
      strIngredient9 ?? '',
      strIngredient10 ?? '',
      strIngredient11 ?? '',
      strIngredient12 ?? '',
      strIngredient13 ?? '',
      strIngredient14 ?? '',
      strIngredient15 ?? '',
    ]);
    return result;
  }

  List<String> get measures {
    List<String> result = [];
    result.addAll([
      strMeasure1 ?? '',
      strMeasure2 ?? '',
      strMeasure3 ?? '',
      strMeasure4 ?? '',
      strMeasure5 ?? '',
      strMeasure6 ?? '',
      strMeasure7 ?? '',
      strMeasure8 ?? '',
      strMeasure9 ?? '',
      strMeasure10 ?? '',
      strMeasure11 ?? '',
      strMeasure12 ?? '',
      strMeasure13 ?? '',
      strMeasure14 ?? '',
      strMeasure15 ?? '',
    ]);
    return result;
  }

  List<Ingredient> get ingredientList {
    final result = IterableZip([ingredients, measures])
        .map((item) => Ingredient(ingredient: item[0], measurement: item[1]))
        .toList();
    result.removeWhere((e) {
      return e.ingredient.trim().isEmpty && e.measurement.trim().isEmpty;
    });
    return result;
  }

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);
}

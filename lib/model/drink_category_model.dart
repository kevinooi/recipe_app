import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink_category_model.g.dart';

@JsonSerializable()
@CopyWith()
class DrinkCategory extends Equatable {
  final String? idDrink;
  final String? strDrink;
  final String? strDrinkThumb;

  const DrinkCategory({
    this.idDrink,
    this.strDrink,
    this.strDrinkThumb,
  });

  @override
  List<Object?> get props => [
        idDrink,
        strDrink,
        strDrinkThumb,
      ];

  factory DrinkCategory.fromJson(Map<String, dynamic> json) =>
      _$DrinkCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkCategoryToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_category_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DrinkCategoryCWProxy {
  DrinkCategory idDrink(String? idDrink);

  DrinkCategory strDrink(String? strDrink);

  DrinkCategory strDrinkThumb(String? strDrinkThumb);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DrinkCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DrinkCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  DrinkCategory call({
    String? idDrink,
    String? strDrink,
    String? strDrinkThumb,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDrinkCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDrinkCategory.copyWith.fieldName(...)`
class _$DrinkCategoryCWProxyImpl implements _$DrinkCategoryCWProxy {
  final DrinkCategory _value;

  const _$DrinkCategoryCWProxyImpl(this._value);

  @override
  DrinkCategory idDrink(String? idDrink) => this(idDrink: idDrink);

  @override
  DrinkCategory strDrink(String? strDrink) => this(strDrink: strDrink);

  @override
  DrinkCategory strDrinkThumb(String? strDrinkThumb) =>
      this(strDrinkThumb: strDrinkThumb);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DrinkCategory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DrinkCategory(...).copyWith(id: 12, name: "My name")
  /// ````
  DrinkCategory call({
    Object? idDrink = const $CopyWithPlaceholder(),
    Object? strDrink = const $CopyWithPlaceholder(),
    Object? strDrinkThumb = const $CopyWithPlaceholder(),
  }) {
    return DrinkCategory(
      idDrink: idDrink == const $CopyWithPlaceholder()
          ? _value.idDrink
          // ignore: cast_nullable_to_non_nullable
          : idDrink as String?,
      strDrink: strDrink == const $CopyWithPlaceholder()
          ? _value.strDrink
          // ignore: cast_nullable_to_non_nullable
          : strDrink as String?,
      strDrinkThumb: strDrinkThumb == const $CopyWithPlaceholder()
          ? _value.strDrinkThumb
          // ignore: cast_nullable_to_non_nullable
          : strDrinkThumb as String?,
    );
  }
}

extension $DrinkCategoryCopyWith on DrinkCategory {
  /// Returns a callable class that can be used as follows: `instanceOfclass DrinkCategory extends Equatable.name.copyWith(...)` or like so:`instanceOfclass DrinkCategory extends Equatable.name.copyWith.fieldName(...)`.
  _$DrinkCategoryCWProxy get copyWith => _$DrinkCategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkCategory _$DrinkCategoryFromJson(Map<String, dynamic> json) =>
    DrinkCategory(
      idDrink: json['idDrink'] as String?,
      strDrink: json['strDrink'] as String?,
      strDrinkThumb: json['strDrinkThumb'] as String?,
    );

Map<String, dynamic> _$DrinkCategoryToJson(DrinkCategory instance) =>
    <String, dynamic>{
      'idDrink': instance.idDrink,
      'strDrink': instance.strDrink,
      'strDrinkThumb': instance.strDrinkThumb,
    };

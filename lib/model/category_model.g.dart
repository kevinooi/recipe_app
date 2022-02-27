// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CategoryCWProxy {
  Category idCategory(String? idCategory);

  Category strCategory(String? strCategory);

  Category strCategoryDescription(String? strCategoryDescription);

  Category strCategoryThumb(String? strCategoryThumb);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Category(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Category(...).copyWith(id: 12, name: "My name")
  /// ````
  Category call({
    String? idCategory,
    String? strCategory,
    String? strCategoryDescription,
    String? strCategoryThumb,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCategory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCategory.copyWith.fieldName(...)`
class _$CategoryCWProxyImpl implements _$CategoryCWProxy {
  final Category _value;

  const _$CategoryCWProxyImpl(this._value);

  @override
  Category idCategory(String? idCategory) => this(idCategory: idCategory);

  @override
  Category strCategory(String? strCategory) => this(strCategory: strCategory);

  @override
  Category strCategoryDescription(String? strCategoryDescription) =>
      this(strCategoryDescription: strCategoryDescription);

  @override
  Category strCategoryThumb(String? strCategoryThumb) =>
      this(strCategoryThumb: strCategoryThumb);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Category(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Category(...).copyWith(id: 12, name: "My name")
  /// ````
  Category call({
    Object? idCategory = const $CopyWithPlaceholder(),
    Object? strCategory = const $CopyWithPlaceholder(),
    Object? strCategoryDescription = const $CopyWithPlaceholder(),
    Object? strCategoryThumb = const $CopyWithPlaceholder(),
  }) {
    return Category(
      idCategory: idCategory == const $CopyWithPlaceholder()
          ? _value.idCategory
          // ignore: cast_nullable_to_non_nullable
          : idCategory as String?,
      strCategory: strCategory == const $CopyWithPlaceholder()
          ? _value.strCategory
          // ignore: cast_nullable_to_non_nullable
          : strCategory as String?,
      strCategoryDescription:
          strCategoryDescription == const $CopyWithPlaceholder()
              ? _value.strCategoryDescription
              // ignore: cast_nullable_to_non_nullable
              : strCategoryDescription as String?,
      strCategoryThumb: strCategoryThumb == const $CopyWithPlaceholder()
          ? _value.strCategoryThumb
          // ignore: cast_nullable_to_non_nullable
          : strCategoryThumb as String?,
    );
  }
}

extension $CategoryCopyWith on Category {
  /// Returns a callable class that can be used as follows: `instanceOfclass Category extends Equatable.name.copyWith(...)` or like so:`instanceOfclass Category extends Equatable.name.copyWith.fieldName(...)`.
  _$CategoryCWProxy get copyWith => _$CategoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      idCategory: json['idCategory'] as String?,
      strCategory: json['strCategory'] as String?,
      strCategoryThumb: json['strCategoryThumb'] as String?,
      strCategoryDescription: json['strCategoryDescription'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };

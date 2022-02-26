import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  const Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  @override
  List<Object?> get props => [
        idCategory,
        strCategory,
        strCategoryThumb,
        strCategoryDescription,
      ];

  Category copyWith({
    required String idCategory,
    required String strCategory,
    required String strCategoryThumb,
    required String strCategoryDescription,
  }) {
    return Category(
      idCategory: this.idCategory,
      strCategory: this.strCategory,
      strCategoryThumb: this.strCategoryThumb,
      strCategoryDescription: this.strCategoryDescription,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'],
      strCategoryThumb: json['strCategoryThumb'],
      strCategoryDescription: json['strCategoryDescription'],
    );
  }

  @override
  String toString() {
    return 'Category { idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription }';
  }
}

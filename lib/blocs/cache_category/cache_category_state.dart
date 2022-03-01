part of 'category_cubit.dart';

abstract class CacheCategoryState extends Equatable {
  const CacheCategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CacheCategoryState {}

class CategoryLoaded extends CacheCategoryState {
  final List<Category> categories;
  const CategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CacheCategoryState {}

part of 'category_cubit.dart';

abstract class MockCategoryState extends Equatable {
  const MockCategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends MockCategoryState {}

class CategoryLoaded extends MockCategoryState {
  final List<Category> categories;
  const CategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoryError extends MockCategoryState {}

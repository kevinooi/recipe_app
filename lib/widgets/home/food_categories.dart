import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../model/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../blocs/blocs.dart';
import '../../config/custom_color.dart';
import '../../config/responsive.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context)
          ? 2.8
          : Responsive.isTablet(context)
              ? 1.2
              : Responsive.isDesktop(context)
                  ? 1.5
                  : 2.5,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const _FoodCategoriesResponsive(categories: null);
          } else if (state is CategoryLoaded) {
            return _FoodCategoriesResponsive(categories: state.categories);
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

class _FoodCategoriesResponsive extends StatelessWidget {
  final List<Category>? categories;
  const _FoodCategoriesResponsive({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories?.length ?? 8,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, i) {
              final category = categories?[i];

              return category == null
                  ? Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: CustomColors.tertiaryText,
                      period: const Duration(milliseconds: 800),
                      child: _CategoryCard(
                        key: Key('food-category-$i'),
                        category: category,
                        onTap: null,
                      ),
                    )
                  : _CategoryCard(
                      key: Key('food-category-$i'),
                      category: category,
                      onTap: () {
                        context.read<MealBloc>().add(
                            LoadMeals(strCategory: category.strCategory ?? ''));
                      },
                    );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isWideDesktop(context) ||
                      Responsive.isDesktop(context)
                  ? 4
                  : 3,
              childAspectRatio: Responsive.isTablet(context)
                  ? 1.7 //1.93
                  : Responsive.isDesktop(context)
                      ? 1.55 //1.7
                      : 2.8, //3
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: categories?.length ?? 12,
            itemBuilder: (context, i) {
              final category = categories?[i];

              return category == null
                  ? Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: CustomColors.tertiaryText,
                      period: const Duration(milliseconds: 800),
                      child: _CategoryCard(
                        key: Key('food-category-$i'),
                        category: category,
                        onTap: null,
                      ),
                    )
                  : _CategoryCard(
                      key: Key('food-category-$i'),
                      category: category,
                      onTap: () {
                        context.read<MealBloc>().add(
                            LoadMeals(strCategory: category.strCategory ?? ''));
                      },
                    );
            },
          );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category? category;
  final VoidCallback? onTap;

  const _CategoryCard({
    Key? key,
    this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: category?.strCategoryThumb ?? '',
                placeholder: (context, url) => const SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  padding: const EdgeInsets.all(5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) {
                  return Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Icon(
                      Icons.error,
                      color: url.isEmpty ? Colors.transparent : Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Text(
                category?.strCategory ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

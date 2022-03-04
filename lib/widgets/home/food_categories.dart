import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:astro_flutter/model/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../blocs/blocs.dart';
import '../../config/custom_color.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, i) {
              return Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: CustomColors.tertiaryText,
                period: const Duration(milliseconds: 800),
                child: const _CategoryCard(
                  category: null,
                  onTap: null,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          );
        } else if (state is CategoryLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.categories.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, i) {
              final category = state.categories[i];
              return _CategoryCard(
                key: Key('food-category-$i'),
                category: category,
                onTap: () {
                  context
                      .read<MealBloc>()
                      .add(LoadMeals(strCategory: category.strCategory ?? ''));
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
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
            children: [
              CachedNetworkImage(
                imageUrl: category?.strCategoryThumb ?? '',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

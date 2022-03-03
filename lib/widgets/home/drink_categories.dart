import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:astro_flutter/model/drink_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../blocs/blocs.dart';
import '../../config/custom_color.dart';

class DrinkCategories extends StatelessWidget {
  const DrinkCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkCategoryBloc, DrinkCategoryState>(
      builder: (context, state) {
        if (state is DrinkCategoryLoading) {
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
                child: const _DrinkCategoryCard(
                  drinkCategory: null,
                  onTap: null,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          );
        } else if (state is DrinkCategoryLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.drinkCategories.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, i) {
              final drinkCategory = state.drinkCategories[i];
              return _DrinkCategoryCard(
                drinkCategory: drinkCategory,
                onTap: () {
                  context.read<DrinkBloc>().add(
                        LoadDrinks(
                          strDrink: drinkCategory.strDrink ?? '',
                        ),
                      );
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

class _DrinkCategoryCard extends StatelessWidget {
  final DrinkCategory? drinkCategory;
  final VoidCallback? onTap;

  const _DrinkCategoryCard({
    Key? key,
    this.drinkCategory,
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
                imageUrl: drinkCategory?.strDrinkThumb ?? '',
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
              SizedBox(
                width: 80,
                child: Text(
                  drinkCategory?.strDrink ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

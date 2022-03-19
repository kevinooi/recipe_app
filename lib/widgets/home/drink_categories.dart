import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/blocs.dart';
import '../../core/custom_color.dart';
import '../../core/responsive.dart';
import '../../model/drink_category_model.dart';

class DrinkCategories extends StatelessWidget {
  const DrinkCategories({
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
                  ? 2
                  : 3.5,
      child: BlocBuilder<DrinkCategoryBloc, DrinkCategoryState>(
        builder: (context, state) {
          if (state is DrinkCategoryLoading) {
            return const _DrinkCategoriesResponsive(drinkCategories: null);
          } else if (state is DrinkCategoryLoaded) {
            return _DrinkCategoriesResponsive(
                drinkCategories: state.drinkCategories);
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}

class _DrinkCategoriesResponsive extends StatelessWidget {
  final List<DrinkCategory>? drinkCategories;
  const _DrinkCategoriesResponsive({Key? key, required this.drinkCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DrinkBloc, DrinkState>(
      listener: (context, state) async {
        if (state is BelgianBlue) {
          await showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(height: 20),
                    Text(
                      'Belgian Blue Special',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Responsive.isMobile(context)
          ? ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: drinkCategories?.length ?? 8,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, i) {
                final drinkCategory = drinkCategories?[i];

                return drinkCategory == null
                    ? Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: CustomColors.tertiaryText,
                        child: _DrinkCategoryCard(
                          key: Key('drink-category-$i'),
                          drinkCategory: drinkCategory,
                          onTap: null,
                        ),
                      )
                    : _DrinkCategoryCard(
                        key: Key('drink-category-$i'),
                        drinkCategory: drinkCategory,
                        onTap: () {
                          context.read<DrinkBloc>().add(
                                LoadDrinks(
                                    strDrink: drinkCategory.strDrink ?? ''),
                              );
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
                    ? 1.7
                    : Responsive.isDesktop(context)
                        ? 1.55
                        : 2.8,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: drinkCategories?.length ?? 12,
              itemBuilder: (context, i) {
                final drinkCategory = drinkCategories?[i];

                return drinkCategory == null
                    ? Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: CustomColors.tertiaryText,
                        child: _DrinkCategoryCard(
                          key: Key(
                              '${drinkCategory?.strDrink?.toLowerCase()}-$i'),
                          drinkCategory: drinkCategory,
                          onTap: null,
                        ),
                      )
                    : _DrinkCategoryCard(
                        key: Key('${drinkCategory.strDrink?.toLowerCase()}-$i'),
                        drinkCategory: drinkCategory,
                        onTap: () {
                          context.read<DrinkBloc>().add(
                                LoadDrinks(
                                    strDrink: drinkCategory.strDrink ?? ''),
                              );
                        },
                      );
              },
            ),
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
            mainAxisAlignment: Responsive.isMobile(context)
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: drinkCategory?.strDrinkThumb ?? '',
                placeholder: (context, url) {
                  return const SizedBox(
                    height: 80,
                    width: 80,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
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
                  maxLines: 2,
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

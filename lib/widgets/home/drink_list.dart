import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/blocs.dart';
import '../../config/custom_color.dart';
import '../../config/extensions.dart';
import '../../model/drink_model.dart';
import '../../model/local/detail_model.dart';

class DrinksList extends StatelessWidget {
  const DrinksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkBloc, DrinkState>(
      builder: (context, state) {
        if (state is DrinkLoading) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, i) {
              return Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: CustomColors.tertiaryText,
                period: const Duration(milliseconds: 800),
                child: const _DrinkCard(
                  drink: null,
                  onTap: null,
                ),
              );
            },
          );
        } else if (state is DrinkLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.drinks.length,
            itemBuilder: (context, i) {
              final drink = state.drinks[i];
              return _DrinkCard(
                drink: drink,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: Detail(drink: drink),
                  );
                },
              );
            },
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _DrinkCard extends StatelessWidget {
  final Drink? drink;
  final VoidCallback? onTap;
  const _DrinkCard({
    Key? key,
    this.drink,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avgRatings = doubleInRange(2, 5);
    final totalRatings = Random().nextInt(300);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: drink?.strDrinkThumb ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                imageBuilder: (context, imageProvider) => Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
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
                    ),
                    child: Icon(
                      Icons.error,
                      color: url.isEmpty ? Colors.transparent : Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drink?.strDrink ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 24,
                        color: drink != null
                            ? CustomColors.primaryRed
                            : Colors.transparent,
                      ),
                      Text(
                        avgRatings.toStringAsFixed(1),
                        style: TextStyle(
                          color: drink != null
                              ? CustomColors.primaryRed
                              : Colors.transparent,
                        ),
                      ),
                      Text(
                        ' ($totalRatings ratings) ',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              drink != null ? Colors.grey : Colors.transparent,
                        ),
                      ),
                      Text(
                        drink?.strCategory ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        ' \u2022 ',
                        style: TextStyle(
                          fontSize: 12,
                          color: drink != null
                              ? CustomColors.primaryRed
                              : Colors.transparent,
                        ),
                      ),
                      Text(
                        drink?.strAlcoholic ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import '../widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../config/custom_color.dart';
import '../../config/extensions.dart';
import '../../config/responsive.dart';
import '../../model/drink_model.dart';

class DrinkList extends StatelessWidget {
  const DrinkList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkBloc, DrinkState>(
      builder: (context, state) {
        if (state is DrinkLoading) {
          return const _DrinksResponsive(drinks: null);
        } else if (state is DrinkLoaded) {
          if (state.drinks.isEmpty) {
            return const EmptyList(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            );
          }
          return _DrinksResponsive(drinks: state.drinks);
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

class _DrinksResponsive extends StatelessWidget {
  final List<Drink>? drinks;
  const _DrinksResponsive({
    Key? key,
    required this.drinks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: drinks?.length ?? 4,
            itemBuilder: (context, i) {
              final drink = drinks?[i];
              return _DrinkCard(
                key: Key('${drink?.strDrink?.toLowerCase()}-$i'),
                drink: drink,
                onTap: () {
                  Navigator.pushNamed(context, '/drink-detail',
                      arguments: drink);
                },
              );
            },
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isWideDesktop(context)
                  ? 4
                  : Responsive.isDesktop(context)
                      ? 3
                      : 2,
              childAspectRatio: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemCount: drinks?.length ?? 8,
            itemBuilder: (context, i) {
              final drink = drinks?[i];
              return _DrinkCard(
                key: Key('${drink?.strDrink?.toLowerCase()}-$i'),
                drink: drink,
                onTap: () {
                  Navigator.pushNamed(context, '/drink-detail',
                      arguments: drink);
                },
              );
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
          crossAxisAlignment:
              Responsive.isMobile(context) || Responsive.isTablet(context)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
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
            Responsive.isMobile(context)
                ? const SizedBox(height: 10)
                : Responsive.isTablet(context)
                    ? const SizedBox(height: 20)
                    : Responsive.isDesktop(context)
                        ? const SizedBox(height: 30)
                        : const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                children: [
                  Text(
                    drink?.strDrink ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Responsive.isWideDesktop(context)
                        ? 20
                        : Responsive.isDesktop(context)
                            ? 10
                            : 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: Responsive.isMobile(context) ||
                                Responsive.isTablet(context)
                            ? 0
                            : 1,
                        child: Row(
                          mainAxisAlignment: Responsive.isMobile(context) ||
                                  Responsive.isTablet(context)
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                          ],
                        ),
                      ),
                      SizedBox(
                          width: Responsive.isWideDesktop(context) ? 20 : 10),
                      Flexible(
                        flex: 2,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '($totalRatings ratings) ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: drink != null
                                      ? Colors.grey
                                      : Colors.transparent,
                                ),
                              ),
                              TextSpan(
                                text: drink?.strCategory ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: ' \u2022 ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: drink != null
                                      ? CustomColors.primaryRed
                                      : Colors.transparent,
                                ),
                              ),
                              TextSpan(
                                text: drink?.strAlcoholic ?? '',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
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

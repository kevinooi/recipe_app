import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/custom_color.dart';
import '../../core/responsive.dart';
import '../../model/drink_model.dart';
import '../../model/meal_model.dart';
import 'article_markdown.dart';
import 'ingredient_tab.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.tabController,
    this.meal,
    this.drink,
  }) : super(key: key);

  final TabController tabController;
  final Meal? meal;
  final Drink? drink;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            collapsedHeight: Responsive.isWideDesktop(context)
                ? 700
                : Responsive.isDesktop(context)
                    ? 600
                    : Responsive.isTablet(context)
                        ? 400
                        : 300,
            // expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: Platform.isAndroid ? 20 : 0,
                right: Platform.isIOS ? 290 : 0,
                bottom: 60,
              ),
              title: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: CustomColors.secondaryRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                ),
              ),
              background: Stack(
                fit: StackFit.loose,
                children: [
                  // Background
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: meal?.strMealThumb ??
                          drink?.strDrinkThumb ??
                          'https://picsum.photos/id/1000/200',
                      placeholder: (context, url) {
                        return const SizedBox(
                          height: 80,
                          width: 80,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: const Icon(
                            Icons.error,
                            color: Colors.white,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                  // Border Radius
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.transparent,
                      height: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 15,
                            decoration: const BoxDecoration(
                              color: CustomColors.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Rating & Play button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 70),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.star_rounded,
                                  size: 20,
                                ),
                                Text(
                                  '4.5 \u2022 15:06',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: CustomColors.primaryText
                                            .withAlpha(200),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            floating: true,
            delegate: _MyDelegate(
              meal: meal,
              drink: drink,
              tabBar: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CustomColors.secondaryRed,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: CustomColors.tertiaryText,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                tabs: const [
                  Tab(text: 'Ingredients'),
                  Tab(text: 'Steps'),
                  Tab(text: 'Nutrition'),
                ],
              ),
            ),
          )
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          IngredientTab(
            meal: meal,
            drink: drink,
          ),
          // Steps Tab
          if (meal?.strInstructions?.isNotEmpty ??
              drink?.strInstructions?.isNotEmpty ??
              false)
            Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Steps for making ${meal?.strMeal ?? drink?.strDrink}',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: ArticleMarkdown(
                    markdownSource:
                        meal?.strInstructions ?? drink?.strInstructions,
                  ),
                ),
              ],
            )
          else
            Center(
              child: Text(
                'Sorry, no instructions provided',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 20),
              ),
            ),
          // Nutrition Tab
          Center(
            child: Text(
              'Coming Soon',
              style:
                  Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyDelegate extends SliverPersistentHeaderDelegate {
  _MyDelegate({
    this.meal,
    this.drink,
    required this.tabBar,
  });
  final Meal? meal;
  final Drink? drink;
  final TabBar tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          // Action buttons above tab bar
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                splashRadius: 16,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                iconSize: 26,
                icon: const Icon(
                  Icons.chat_outlined,
                ),
              ),
              const SizedBox(width: 3),
              Text((meal?.idMeal ?? drink?.idDrink).toString()),
              const Spacer(),
              IconButton(
                onPressed: () {},
                splashRadius: 16,
                padding: EdgeInsets.zero,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                iconSize: 30,
                icon: const Icon(
                  Icons.star_border_rounded,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                splashRadius: 16,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                iconSize: 30,
                icon: const Icon(
                  Icons.bookmark_outline,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                splashRadius: 16,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                iconSize: 30,
                icon: const Icon(
                  Icons.share_outlined,
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.black26, height: 30, thickness: 0.5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: tabBar,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 70;

  @override
  double get minExtent => tabBar.preferredSize.height + 70;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

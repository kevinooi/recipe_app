import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../widgets.dart';
import 'background_wave.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  const SliverSearchAppBar();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool foodMenu = context.watch<MenuCubit>().foodMenu;
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.3;
    double topPadding = MediaQuery.of(context).padding.top /*16*/;

    return Stack(
      children: [
        const BackgroundWave(
          height: 280,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Visibility(
                visible: offset <= 20 ? false : true,
                child: Center(
                  child: Text(
                    'Popular ' + (foodMenu ? 'Food' : 'Drink'),
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ),
              // const Text(
              //   'Delivering to',
              //   style: TextStyle(
              //     fontSize: 10,
              //     color: Colors.grey,
              //   ),
              // ),
              // const SizedBox(height: 5),
              // Row(
              //   children: const <Widget>[
              //     Text(
              //       'Current Location',
              //       style: TextStyle(
              //         fontSize: 18,
              //         color: Colors.grey,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     SizedBox(width: 20),
              //     Icon(
              //       Icons.keyboard_arrow_down_rounded,
              //       color: Color(0xff9A2828),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 30),
            ],
          ),
        ),
        Positioned(
          top: topPadding + offset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SearchBox(suffixText: foodMenu ? 'Food' : 'Drink'),
              // Category
              foodMenu ? const FoodCategories() : const DrinkCategories(),
            ],
          ),
          left: 20,
          right: 20,
        ),
      ],
    );
  }

  @override
  double get maxExtent => 260;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}

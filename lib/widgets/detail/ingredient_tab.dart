import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../config/custom_color.dart';
import '../../model/drink_model.dart';
import '../../model/meal_model.dart';

class IngredientTab extends StatelessWidget {
  final Meal? meal;
  final Drink? drink;
  const IngredientTab({
    Key? key,
    this.meal,
    this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: (meal?.ingredientList.isNotEmpty ??
              drink?.ingredientList.isNotEmpty ??
              false)
          ? Column(
              children: [
                const SizedBox(height: 25),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Ingredients For',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${context.watch<ServingCubit>().state} Servings',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                fontWeight: FontWeight.normal,
                                color: CustomColors.primaryText.withAlpha(200),
                              ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _RoundButton(
                          key: const Key('increment'),
                          onTap: () => context.read<ServingCubit>().increment(),
                          icon: const Icon(
                            Icons.add,
                            size: 16,
                            color: Colors.white,
                          ),
                          color: CustomColors.secondaryRed,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 20,
                          child: Text(
                            '${context.watch<ServingCubit>().state}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 10),
                        _RoundButton(
                          key: const Key('decrement'),
                          onTap: () => context.read<ServingCubit>().decrement(),
                          icon: const Icon(
                            Icons.remove,
                            size: 16,
                            color: Colors.white,
                          ),
                          color: context.watch<ServingCubit>().decrementColor,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.black26, height: 0, thickness: 0.2),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: meal?.ingredientList.length ??
                        drink?.ingredientList.length ??
                        0,
                    separatorBuilder: (context, i) {
                      return const Divider(
                        color: Colors.black26,
                        height: 20,
                        thickness: 0.2,
                      );
                    },
                    itemBuilder: (ctx, i) {
                      final ingredient =
                          (meal?.ingredientList.isNotEmpty ?? false)
                              ? meal!.ingredientList[i]
                              : drink!.ingredientList[i];

                      return Row(
                        key: Key('item-$i-ingredient'),
                        children: [
                          CachedNetworkImage(
                            imageUrl: meal?.strMealThumb ??
                                drink?.strDrinkThumb ??
                                'https://picsum.photos/id/488/20/20',
                            imageBuilder: (context, imageProvider) => Container(
                              padding: const EdgeInsets.all(2),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: CustomColors.tertiaryText,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) {
                              return Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Icon(
                                  Icons.error,
                                  color: url.isEmpty
                                      ? Colors.transparent
                                      : Colors.white,
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment:
                                ingredient.measurement.isNotEmpty
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.center,
                            children: [
                              Text(
                                ingredient.ingredient,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              if (ingredient.measurement.isNotEmpty) ...[
                                const SizedBox(height: 5),
                                Text(
                                  ingredient.measurement,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: CustomColors.tertiaryText),
                                ),
                              ],
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )
          : Center(
              child: Text(
                'No Ingredients provided',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 20),
              ),
            ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final Icon icon;
  final Color color;
  const _RoundButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: icon,
          ),
        ),
      ),
    );
  }
}

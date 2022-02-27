import 'dart:math';
import 'package:astro_flutter/config/custom_color.dart';
import 'package:astro_flutter/model/meal_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Meal? meal;
  final VoidCallback? onTap;
  const MealCard({
    Key? key,
    this.meal,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avgRatings = Random().nextInt(5);
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
                imageUrl: meal?.strMealThumb ?? '',
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
                    meal?.strMeal ?? '',
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
                        color: meal != null
                            ? CustomColors.primaryRed
                            : Colors.transparent,
                      ),
                      Text(
                        avgRatings.toStringAsFixed(2),
                        style: TextStyle(
                          color: meal != null
                              ? CustomColors.primaryRed
                              : Colors.transparent,
                        ),
                      ),
                      Text(
                        ' ($totalRatings ratings) ',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              meal != null ? Colors.grey : Colors.transparent,
                        ),
                      ),
                      Text(
                        meal?.strCategory ?? '',
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
                          color: meal != null
                              ? CustomColors.primaryRed
                              : Colors.transparent,
                        ),
                      ),
                      Text(
                        meal?.strArea ?? '',
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

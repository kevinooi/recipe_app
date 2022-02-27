import 'package:astro_flutter/model/drink_category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrinkCategoryCard extends StatelessWidget {
  final DrinkCategory? drinkCategory;
  final VoidCallback? onTap;

  const DrinkCategoryCard({
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

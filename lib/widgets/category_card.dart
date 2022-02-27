import 'package:astro_flutter/model/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;
  final VoidCallback? onTap;

  const CategoryCard({
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
          child: _RoundedBox(category: category),
        ),
      ),
    );
  }
}

class _RoundedBox extends StatelessWidget {
  const _RoundedBox({
    Key? key,
    this.category,
  }) : super(key: key);

  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                fit: BoxFit.contain,
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
    );
  }
}

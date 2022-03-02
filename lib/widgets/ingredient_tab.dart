import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/custom_color.dart';

class IngredientTab extends StatelessWidget {
  const IngredientTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 25),
                  Text(
                    'Ingredients For',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '2 Servings',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: CustomColors.primaryText.withAlpha(200),
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: const <Widget>[
                  _RoundButton(
                    icon: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                    color: CustomColors.secondaryRed,
                  ),
                  SizedBox(width: 15),
                  Text(
                    // counter
                    '1',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 15),
                  _RoundButton(
                    icon: Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.white,
                    ),
                    // check counter
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.black26, height: 30, thickness: 0.2),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (context, i) {
                return const Divider(
                    color: Colors.black26, height: 20, thickness: 0.2);
              },
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/id/488/20/20',
                      imageBuilder: (context, imageProvider) => Container(
                        padding: const EdgeInsets.all(2),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
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
                            color:
                                url.isEmpty ? Colors.transparent : Colors.white,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'description',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: CustomColors.tertiaryText),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  const _RoundButton({
    Key? key,
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
          onTap: () {},
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: icon,
          ),
        ),
      ),
    );
  }
}

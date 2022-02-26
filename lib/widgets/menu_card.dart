import 'dart:math';

import 'package:flutter/material.dart';

import '../config/custom_color.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  const MenuCard({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // TODO: bloc management
    int itemsNumber = Random().nextInt(200);

    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 50,
        right: 40,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30),
                right: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 2),
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(30),
                  right: Radius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 60,
                    top: 20,
                    right: 15,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '$itemsNumber items',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 13,
            left: -30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                // TODO: cache loading
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 18,
            right: -25,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: null,
              mini: true,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.chevron_right,
                color: CustomColors.primaryRed,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

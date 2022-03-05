import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
    this.message = "It's Empty Here :(",
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.shrinkWrap = false,
  }) : super(key: key);

  final String message;
  final ScrollPhysics physics;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   "assets/logo.png",
              //   color: CustomColors.textSecondary,
              //   scale: 2,
              //   fit: BoxFit.contain,
              // ),
              // SizedBox(height: 5),
              Text(
                message,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        ListView(
          physics: physics,
          shrinkWrap: shrinkWrap,
        )
      ],
    );
  }
}

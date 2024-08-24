import 'package:flutter/material.dart';
import 'package:movies_app/generated/assets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(Assets.imagesCover),
              Image.asset(Assets.imagesPlayButton),
              Stack(
                children: [
                  Image.asset(Assets.imagesDora),
                  Image.asset(Assets.imagesBookmark)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

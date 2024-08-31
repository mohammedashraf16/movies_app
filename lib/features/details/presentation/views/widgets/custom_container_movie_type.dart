import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';

class CustomContainerMovieType extends StatelessWidget {
  const CustomContainerMovieType({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grayColor),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "action",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

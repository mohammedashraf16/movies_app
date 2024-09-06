import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/details/model/DetailsResponse.dart';


class CustomContainerMovieType extends StatelessWidget {
  const CustomContainerMovieType({super.key, required this.genres,});
final Genres genres;
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
        genres.name??"",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}

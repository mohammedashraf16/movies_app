import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/home/data/models/more_like_response.dart';
import 'package:movies_app/generated/assets.dart';

class CustomMoreLikeItem extends StatelessWidget {
  CustomMoreLikeItem({required this.model, super.key});

  MoreLikeResults model;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      color: AppColors.secondaryColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25),
        width: width * .35,
        height: height * .4,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: AppColors.primaryColor, offset: Offset(2, 4))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      "${Constants.imageUrl}${model.posterPath}",
                      height: height * .22,
                      width: width,
                      fit: BoxFit.cover,
                    )),
                Image.asset(Assets.imagesBookmark),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.yellowColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(model.voteAverage.toString().substring(0, 3)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                model.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                overflow: TextOverflow.ellipsis,
                model.releaseDate ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

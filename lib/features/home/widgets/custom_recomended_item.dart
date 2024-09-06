import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/data/models/recommending_response.dart';
import 'package:movies_app/features/home/widgets/custom_ink_well_item.dart';

class CustomRecomendedItem extends StatelessWidget {
  CustomRecomendedItem(
      {super.key, required this.recommendingResponse, required this.results});

  final RecommendingResponse recommendingResponse;
  Results results;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Card(
        child: Container(
          width: width*.35,
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
                      height: height * .22,
                      width: width,
                      "${Constants.imageUrl}${results.posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomInkWellItem(results: results)
                ],
              ),
              const SizedBox(height: 5),
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
                    Text(results.voteAverage.toString().substring(0, 3)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  results.title ?? "",
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  results.releaseDate ?? "",
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.grayColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/tabs/watch_list/model/movie_model.dart';
import 'package:movies_app/generated/assets.dart';

class CustomSlidableItem extends StatefulWidget {
  const CustomSlidableItem({required this.results, super.key});

  final Results results;

  @override
  State<CustomSlidableItem> createState() => _CustomSlidableItemState();
}

class _CustomSlidableItemState extends State<CustomSlidableItem> {
  @override
  Widget build(BuildContext context) {
    var movieModel = MovieModel(
      image: "${Constants.imageUrl}${widget.results.posterPath}",
      title: widget.results.title ?? "",
      date: widget.results.releaseDate ?? "",
      description: widget.results.overview ?? "",
      averageRate: widget.results.voteAverage.toString().substring(0, 3),
      isSelected: false
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: width,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: width,
                height: height * .25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "${Constants.imageUrl}${widget.results.backdropPath}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 5,
              child: Stack(
                children: [
                  Container(
                    width: width * .32,
                    height: height * .23,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "${Constants.imageUrl}${widget.results.backdropPath}"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseFunctions.addMovie(movieModel);
                      movieModel.isSelected=true;
                    },
                    child: Image.asset(
                      movieModel.isSelected
                          ? Assets.imagesYellowBookmark
                          : Assets.imagesBookmark,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 164,
              top: 231,
              child: Text(
                widget.results.originalTitle ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 162,
              top: 258,
              child: Text(
                widget.results.releaseDate ?? "",
                style: const TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

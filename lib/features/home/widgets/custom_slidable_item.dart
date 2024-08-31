import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/generated/assets.dart';

class CustomSlidableItem extends StatelessWidget {
  const CustomSlidableItem({required this.results ,super.key});
  final Results results;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30,vertical: 10.0),
      child: SizedBox(
        width: width,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: width,
                height: height*.25,
                decoration:  BoxDecoration(
                  image:  DecorationImage(
                    image: NetworkImage("${Constants.imageUrl}${results.backdropPath}"),
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
                    width: width*.32,
                    height: height*.23,
                    decoration: ShapeDecoration(
                      image:   DecorationImage(
                        image: NetworkImage("${Constants.imageUrl}${results.backdropPath}"),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  Image.asset(Assets.imagesBookmark),
                ],
              ),
            ),
            Positioned(
              left: 164,
              top: 231,
              child: Text(
                results.originalTitle??"",
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
                results.releaseDate??"",
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

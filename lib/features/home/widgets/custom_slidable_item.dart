import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import '../data/models/popular_response.dart';
import 'custom_ink_well_item.dart';

class CustomSlidableItem extends StatefulWidget {
  CustomSlidableItem({required this.results, super.key});

  final Results results;
  bool isSelected = false;

  @override
  State<CustomSlidableItem> createState() => _CustomSlidableItemState();
}

class _CustomSlidableItemState extends State<CustomSlidableItem> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
                      "${Constants.imageUrl}${widget.results.backdropPath}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 15,
              child: Stack(
                children: [
                  Container(
                    width: width * .32,
                    height: height * .23,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "${Constants.imageUrl}${widget.results.backdropPath}"),
                          fit: BoxFit.cover),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  CustomInkWellItem(results: widget.results)
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

import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/core/generated/assets.dart';
import 'package:movies_app/features/home/tabs/watch_list/model/movie_model.dart';

import '../data/models/popular_response.dart';

class CustomInkWellItem extends StatefulWidget {
  CustomInkWellItem({super.key, required this.results});
  final Results results;
  bool isSelected = false;
  @override
  State<CustomInkWellItem> createState() => _CustomInkWellItemState();
}

class _CustomInkWellItemState extends State<CustomInkWellItem> {

  @override
  void initState() {
    super.initState();
    isAdded();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.isSelected == false) {
          var movieModel = MovieModel(
            image:
            "${Constants.imageUrl}${widget.results.posterPath}",
            title: widget.results.title ?? "",
            date: widget.results.releaseDate ?? "",
            description: widget.results.overview ?? "",
            averageRate: widget.results.voteAverage
                .toString()
                .substring(0, 3),
          );
          try {
            await FirebaseFunctions.addMovie(movieModel);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(seconds: 1),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )),
                  content: Text(
                      '${widget.results.title} added to watch list!')),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      )),
                  content:
                  Text('Failed to update watch list: $e')),
            );
          }
          setState(() {
            widget.isSelected = !widget.isSelected;
          });

        }
        else if (widget.isSelected == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )),
                content: Text(
                    "${widget.results.title} already added to watch list!")),
          );
        }
      },
      child: Image.asset(
        height: 35,
        widget.isSelected
            ? Assets.imagesYellowBookmark
            : Assets.imagesBookmark,
      ),
    );
  }
  Future<void> isAdded() async {
    bool added =
    await FirebaseFunctions.isMovieAdded(widget.results.title ?? "");
    setState(() {
      widget.isSelected = added;
    });
  }
}

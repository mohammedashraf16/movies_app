import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/details/presentation/views/details_view.dart';
import 'package:movies_app/features/home/data/models/up_coming_response.dart';
import 'package:movies_app/generated/assets.dart';

class CustomNewReleasesMovieItem extends StatelessWidget {
  CustomNewReleasesMovieItem({required this.upComingResponse, super.key, required this.results});

  UpComingResponse upComingResponse;
  final Results results;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, DetailsView.routeName,arguments: results);
            },
            child: Image.network("${Constants.imageUrl}${results.posterPath}")
          ),
          Image.asset(Assets.imagesBookmark),
        ],
      ),
    );
  }
}

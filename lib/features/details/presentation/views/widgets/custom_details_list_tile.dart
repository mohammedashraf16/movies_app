import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/features/details/presentation/views/widgets/custom_details_shimmer_widget.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/tabs/watch_list/model/movie_model.dart';
import 'package:movies_app/generated/assets.dart';

import '../../../../../app_colors.dart';
import '../../../../home/data/models/up_coming_response.dart';
import 'custom_container_movie_type.dart';

class CustomDetailsLsiTile extends StatelessWidget {
  const CustomDetailsLsiTile({super.key, required this.model});

  final Results model;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: FutureBuilder(
          future: ApiManager.getDetailsResponse(model.id!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomDetailsShimmerWidget();
            }
            if (snapshot.hasError) {
              return Text("Error : ${snapshot.error}");
            }
            var genres = snapshot.data?.genres;
            var movieModel = MovieModel(
              image: "${Constants.imageUrl}${snapshot.data?.posterPath ?? ""}",
              title: snapshot.data?.title ?? "",
              date: snapshot.data?.releaseDate ?? "",
              description: snapshot.data?.overview ?? "",
              averageRate:
                  snapshot.data?.voteAverage.toString().substring(0, 3) ?? "",
            );
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                        "${Constants.imageUrl}${snapshot.data?.posterPath ?? ""}",
                        width: MediaQuery.of(context).size.width * .3),
                    InkWell(
                      onTap: () {
                        FirebaseFunctions.addMovie(movieModel).then(
                          (value) {
                            movieModel.isSelected = true;
                            FirebaseFunctions.updateMovie(movieModel);
                          },
                        );
                      },
                      child: movieModel.isSelected
                          ? Image.asset(Assets.imagesYellowBookmark)
                          : Image.asset(Assets.imagesBookmark),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .66,
                  height: MediaQuery.of(context).size.height * .4,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: genres?.length,
                            itemBuilder: (context, index) {
                              return CustomContainerMovieType(
                                genres: genres![index],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          snapshot.data?.overview ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              snapshot.data?.voteAverage
                                      .toString()
                                      .substring(0, 3) ??
                                  "",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

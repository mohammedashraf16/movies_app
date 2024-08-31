import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/details/presentation/views/widgets/custom_details_shimmer_widget.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
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
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                        "${Constants.imageUrl}${snapshot.data?.posterPath ?? ""}",
                        height: MediaQuery.of(context).size.height * .23,
                        width: MediaQuery.of(context).size.width * .3),
                    Image.asset(Assets.imagesBookmark),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .66,
                  height: MediaQuery.of(context).size.height * .4,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomContainerMovieType(),
                            CustomContainerMovieType(),
                            CustomContainerMovieType(),
                          ],
                        ),
                        const CustomContainerMovieType(),
                        Text(
                          snapshot.data?.overview ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                              style: Theme.of(context).textTheme.bodyLarge,
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


import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/generated/assets.dart';

class WatchListBody extends StatelessWidget {
  const WatchListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10, bottom: 15),
          child: Text(
            "Watchlist",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        StreamBuilder(
          stream: FirebaseFunctions.getMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.secondaryColor,
              ));
            }
            if (snapshot.hasError) {
              return Text("Error fetching movies: ${snapshot.error}");
            }
            var movies = snapshot.data?.docs
                    .map(
                      (doc) => doc.data(),
                    )
                    .toList() ??
                [];
            if (movies.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*.4),
                    Text(
                      "No movies in your watchlist",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 0,
                            color: AppColors.primaryColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(children: [
                                  Image.network(
                                    movies[index].image,
                                    height: MediaQuery.of(context).size.height *
                                        .19,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      FirebaseFunctions.deleteMovie(
                                          movies[index].id);
                                    },
                                    child: Image.asset(
                                      Assets.imagesYellowBookmark,
                                      height: 40,
                                    ),
                                  ),
                                ]),
                                Flexible(
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            overflow: TextOverflow.ellipsis,
                                            movies[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(movies[index].date,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(fontSize: 12)),
                                          const SizedBox(height: 10),
                                          Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            movies[index].description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: AppColors.yellowColor),
                                              Text(
                                                movies[index]
                                                    .averageRate
                                                    .substring(0, 3),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: AppColors.grayColor,
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

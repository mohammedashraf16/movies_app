import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/core/generated/assets.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/features/home/tabs/watch_list/model/movie_model.dart';

class CustomFavListView extends StatelessWidget {
  const CustomFavListView({
    super.key,
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
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
                              try{
                                FirebaseFunctions.deleteMovie(movies[index].id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${movies[index].title} removed from watch list!')),
                                );
                              }catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Failed to update watch list: $e')),
                                );
                              }

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
  }
}

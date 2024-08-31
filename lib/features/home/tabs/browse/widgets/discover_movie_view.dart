import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/data/models/GenreResponse.dart';

class DiscoverMovieView extends StatelessWidget {
  static const String routeName = "discover";

  const DiscoverMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)?.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover Movies",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getDiscoverMovieResponse(model.id??0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          if (!snapshot.hasData || snapshot.data?.results == null) {
            return const Center(child: Text('No results found'));
          }
          final results = snapshot.data!.results!;
          if (results.isEmpty) {
            return const Center(child: Text('No movies found'));
          }
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    elevation: 0,
                    color: AppColors.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network("${Constants.imageUrl}${results[index].posterPath}",height: 200,),
                        Flexible(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    results[index].title??"",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(results[index].releaseDate?.substring(0,10)??"",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(fontSize: 12)),
                                  const SizedBox(height: 10),
                                  Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    results[index].overview??"",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(Icons.language,color: Colors.white,),
                                      const SizedBox(width: 5),
                                      Text(
                                        results[index].originalLanguage??"",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(Icons.star,color: AppColors.yellowColor),
                                      Text(
                                        results[index].voteAverage.toString().substring(0,3),
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.grayColor,)
                ],
              );
            },
          );
        },
      ),
    );
  }
}

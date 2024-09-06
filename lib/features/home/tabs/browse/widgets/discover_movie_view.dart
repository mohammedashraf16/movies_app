import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/data/models/GenreResponse.dart';
import 'package:movies_app/features/home/widgets/custom_ink_well_item.dart';

class DiscoverMovieView extends StatelessWidget {
  static const String routeName = "discover";

  const DiscoverMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)?.settings.arguments as Genres;
    if (model == null) {
      return const Scaffold(
        body: Center(child: Text('No genre data available')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${model.name} Movies",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getDiscoverMovieResponse(model.id ?? 0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.grayColor,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data?.results == null) {
            return const Center(child: Text('No results found'));
          }
          final results = snapshot.data!.results!;
          if (results.isEmpty) {
            return const Center(child: Text('No movies found'));
          }

          return ListView.separated(
            itemCount: results.length,
            separatorBuilder: (context, index) => const Divider(
              color: AppColors.grayColor,
            ),
            itemBuilder: (context, index) {
              // TODO: to convert from List<Results> to Type of Results
              final movie = results[index];
              return Card(
                elevation: 0,
                color: AppColors.primaryColor,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "${Constants.imageUrl}${movie.posterPath}",
                          height: 200,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: Colors.grey,
                              size: 50,
                            );
                          },
                        ),
                        CustomInkWellItem(results: movie),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              movie.title ?? "No title available",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              movie.releaseDate?.substring(0, 10) ??
                                  "No release date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              movie.overview ?? "No overview available",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  movie.originalLanguage ?? "Unknown",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: AppColors.yellowColor),
                                Text(
                                  movie.voteAverage?.toStringAsFixed(1) ??
                                      "0.0",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

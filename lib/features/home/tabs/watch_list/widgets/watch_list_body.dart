import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/core/functions/firebase_functions.dart';
import 'package:movies_app/features/home/tabs/watch_list/widgets/custom_fav_list_view.dart';

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
            return CustomFavListView(movies: movies);
          },
        ),
      ],
    );
  }
}


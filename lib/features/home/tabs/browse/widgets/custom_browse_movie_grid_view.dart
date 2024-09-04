import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/tabs/browse/widgets/discover_movie_view.dart';
import 'package:movies_app/generated/assets.dart';

class CustomBrowseMovieGridView extends StatelessWidget {
  const CustomBrowseMovieGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getGenreResponse(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.grayColor,
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data?.genres == null) {
          return const Center(child: Text('No results found'));
        }
        final genres = snapshot.data!.genres!;
        if (genres.isEmpty) {
          return const Center(child: Text('No Categories found'));
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: genres.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DiscoverMovieView.routeName,
                      arguments:  genres[index],
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage(Assets.imagesTypeMovies),
                          fit: BoxFit.fitWidth,
                        )),
                    child: Text(
                      genres[index].name ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 22),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

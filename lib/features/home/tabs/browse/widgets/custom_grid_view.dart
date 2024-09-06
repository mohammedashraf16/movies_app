import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/assets.dart';
import 'package:movies_app/features/home/data/models/GenreResponse.dart';
import 'package:movies_app/features/home/tabs/browse/widgets/discover_movie_view.dart';

class CustomGirdView extends StatelessWidget {
  const CustomGirdView({
    super.key,
    required this.genres,
  });

  final List<Genres> genres;

  @override
  Widget build(BuildContext context) {
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
  }
}
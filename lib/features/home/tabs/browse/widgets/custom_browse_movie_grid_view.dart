import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/tabs/browse/widgets/custom_grid_view.dart';

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
        return CustomGirdView(genres: genres);
      },
    );
  }
}



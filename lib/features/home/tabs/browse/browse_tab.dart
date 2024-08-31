import 'package:flutter/material.dart';
import 'package:movies_app/features/home/tabs/browse/widgets/custom_browse_movie_grid_view.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              textAlign: TextAlign.start,
              "Browse Category",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
           const CustomBrowseMovieGridView()
        ],
      ),
    );
  }
}


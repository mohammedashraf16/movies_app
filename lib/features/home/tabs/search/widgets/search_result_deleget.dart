import 'package:flutter/material.dart';
import 'package:movies_app/features/home/tabs/search/widgets/custom_search_list_view.dart';
import 'package:movies_app/generated/assets.dart';

class SearchResultDelegate extends SearchDelegate {
  SearchResultDelegate()
      : super(
          searchFieldLabel: 'Search Movies',
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BuildSearchData(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Column(
          verticalDirection: VerticalDirection.down,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.35),
            Image.asset(Assets.imagesIconLocalMovies),
            Text(
              "No movies found",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),

      );
    }
    return BuildSearchData(query: query);
  }
}


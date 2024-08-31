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
            Image.asset(Assets.imagesIconWatchList),
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

// child: FutureBuilder(
//   future: ApiManager.getSearchResponse(query: query),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     if (snapshot.hasError) {
//       return Center(child: Text('Error: ${snapshot.error}'));
//     }
//     if (!snapshot.hasData || snapshot.data?.results == null) {
//       return const Center(child: Text('No suggestions found'));
//     }
//
//     final results = snapshot.data!.results!;
//     if(results.isEmpty){
//       return const Center(child: Text('No suggestions found'));
//     }
//
//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         return CustomSearchItem(
//           results: results[index],
//         );
//       },
//     );
//   },
// ),

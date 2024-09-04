import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/tabs/search/widgets/custom_search_item.dart';

class BuildSearchData extends StatelessWidget {
  const BuildSearchData({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: FutureBuilder(
        future: ApiManager.getSearchResponse(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: AppColors.secondaryColor,));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data?.results == null) {
            return const Center(child: Text('No results found'));
          }

          final results = snapshot.data!.results!;
          if (results.isEmpty) {
            return const Center(child: Text('No suggestions found'));
          }

          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              return CustomSearchItem(results: results[index]);
            },
          );
        },
      ),
    );
  }
}
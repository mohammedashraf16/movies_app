import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/widgets/custom_recomended_item.dart';

import '../data/models/recommending_response.dart';

class CustomRecomendedListView extends StatelessWidget {
  CustomRecomendedListView({super.key, required this.text});

  final String text;
  List<Results> results = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .46,
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child:
                    Text(text, style: Theme.of(context).textTheme.bodyMedium),
              ),
              Expanded(
                  child: FutureBuilder(
                future: ApiManager.getRecommendingResponse(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                  results = snapshot.data?.results ?? [];
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 15);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return CustomRecomendedItem(
                        results: results[index],
                        recommendingResponse: RecommendingResponse(),
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

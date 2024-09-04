import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/home/tabs/search/model/SearchModel.dart';
import 'package:movies_app/generated/assets.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({
    super.key,
    required this.results,
  });

  final SearchResults results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      "${Constants.imageUrl}${results.posterPath}",
                      height: MediaQuery.of(context).size.height * .16,
                    ),
                    Image.asset(Assets.imagesBookmark)
                  ],
                ),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            results.title ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(results.releaseDate?.substring(0, 10) ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 12)),
                          const SizedBox(height: 10),
                          Text(
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            results.overview ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.grayColor,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/widgets/custom_ink_well_item.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({
    super.key,
    required this.results,
  });

  final Results results;

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
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.grey,
                          size: 50,
                        );
                      },
                      "${Constants.imageUrl}${results.posterPath ?? ""}",
                      height: MediaQuery.of(context).size.height * .16,
                    ),
                    CustomInkWellItem(results: results),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          results.title ?? "Can't find title",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          results.overview ?? "Can't find overview",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              results.originalLanguage ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.grayColor,
          ),
        ],
      ),
    );
  }
}

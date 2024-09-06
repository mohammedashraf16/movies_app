import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/widgets/custom_new_releases_item.dart';

import '../data/models/up_coming_response.dart';

class CustomNewReleasesMoviesListView extends StatefulWidget {
  const CustomNewReleasesMoviesListView({super.key});

  @override
  State<CustomNewReleasesMoviesListView> createState() =>
      _CustomNewReleasesMoviesListViewState();
}

class _CustomNewReleasesMoviesListViewState
    extends State<CustomNewReleasesMoviesListView> {
  List<Results> items = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .23,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Text(
              "New Releases",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: FutureBuilder(
                  future: ApiManager.getUpComingResponse(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.secondaryColor,
                      ));
                    }
                    if (snapshot.hasError) {
                      return Text("Error : ${snapshot.error}");
                    }
                    items = snapshot.data?.results ?? [];
                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 12,
                      ),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CustomNewReleasesMovieItem(

                          upComingResponse: UpComingResponse(),
                          results: items[index],
                        );
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/features/home/widgets/custom_carousel_slider.dart';
import 'package:movies_app/features/home/widgets/custom_new_releases_list_view.dart';
import 'package:movies_app/features/home/widgets/custom_recomended_list_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomCarouselSlider()),
          const SliverToBoxAdapter(child: CustomNewReleasesMoviesListView()),
          const SliverToBoxAdapter(child: SizedBox(height: 20,)),
          SliverToBoxAdapter(child: CustomRecomendedListView(text: "Recomended",)),

        ],
      ),
    );
  }
}



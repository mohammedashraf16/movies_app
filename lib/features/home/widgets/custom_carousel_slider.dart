import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';
import 'package:movies_app/features/home/data/models/popular_response.dart';
import 'package:movies_app/features/home/widgets/custom_slidable_item.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final selectedIndex = 0;
  List<Results> items = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: ApiManager.getPopularResponse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ));
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          items = snapshot.data?.results ?? [];
          // items.forEach((element) {
          //   element.isSelected;
          // },)
          return CarouselSlider(
            options: CarouselOptions(
              height: height * .38,
              scrollPhysics: const PageScrollPhysics(),
              enlargeCenterPage: true,
              autoPlay: true,
              animateToClosest: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: items.map((movie) {
              return Builder(builder: (BuildContext context) {
                return CustomSlidableItem(
                  results: movie,
                );
              });
            }).toList(),
          );
        });
  }
}

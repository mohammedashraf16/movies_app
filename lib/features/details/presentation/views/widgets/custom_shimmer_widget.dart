import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryColor,
      highlightColor: AppColors.secondaryColor,
      period: const Duration(seconds: 3),
      child: Container(
        width: MediaQuery.of(context).size.width*.3,
        height: MediaQuery.of(context).size.height * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:AppColors.primaryColor
        ),

      ),
    );
  }
}
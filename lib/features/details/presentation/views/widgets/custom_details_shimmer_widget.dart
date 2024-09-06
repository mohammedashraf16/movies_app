import 'package:flutter/material.dart';
import 'package:movies_app/core/generated/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomDetailsShimmerWidget extends StatelessWidget {
  const CustomDetailsShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 3),
      highlightColor: AppColors.secondaryColor,
      baseColor: AppColors.primaryColor,
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.
                    circular(10),
                    color: AppColors.whiteColor
                )
            ), Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.
                    circular(10),
                    color: AppColors.whiteColor
                )
            ), Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.
                    circular(10),
                    color: AppColors.whiteColor
                )
            ),
          ],
        ),
      ),
    );
  }
}

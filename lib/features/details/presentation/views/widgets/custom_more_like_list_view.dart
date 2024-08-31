import 'package:flutter/material.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/features/details/presentation/views/widgets/custom_more_like_item.dart';
import 'package:movies_app/features/details/presentation/views/widgets/custom_shimmer_widget.dart';
import 'package:movies_app/features/home/data/apis/api_manager.dart';

import '../../../../home/data/models/more_like_response.dart';
import '../../../../home/data/models/up_coming_response.dart';

class CustomMoreLikeListView extends StatelessWidget {
   const CustomMoreLikeListView({super.key, required this.model});
   final Results model;
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
                Text("More Like This", style: Theme.of(context).textTheme.bodyMedium),
              ),
              Expanded(
                child:FutureBuilder(future: ApiManager.getSimilarResponse(model.id!), builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return  const CustomShimmerWidget();
                  }
                  if(snapshot.hasError){
                    return Text('Error : ${snapshot.error}');
                  }
                  if(snapshot.data==null){
                    return const Text('No data found');
                  }
                  MoreLikeResponse similarResponse = snapshot.data!;
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 15);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: similarResponse.results!.length,
                    itemBuilder: (context, index) {
                      return  CustomMoreLikeItem(
                        model: similarResponse.results![index],
                      );
                    },
                  );
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



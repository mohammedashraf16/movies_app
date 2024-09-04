import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/features/details/presentation/views/widgets/custom_details_list_tile.dart';
import 'package:movies_app/features/details/presentation/views/widgets/custom_more_like_list_view.dart';
import 'package:movies_app/features/home/data/models/up_coming_response.dart';
import 'package:movies_app/generated/assets.dart';

class DetailsView extends StatelessWidget {
  static const routeName = "details";
    const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var model = ModalRoute.of(context)?.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          overflow: TextOverflow.ellipsis,
          model.title ?? "",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: width,
                  height: height * .25,
                  child:
                  Image.network("${Constants.imageUrl}${model.backdropPath}"),
                ),
                Image.asset(Assets.imagesPlayButton)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15),
              child: Text(
                model.title ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                model.releaseDate ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            CustomDetailsLsiTile(model: model,),

            CustomMoreLikeListView(model:model),
          ],
        ),
      ),
    );
  }
}




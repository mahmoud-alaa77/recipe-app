import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as ui;
import '../constants.dart';
import '../cubits/recipe_cubit/recipe_cubit.dart';
import 'custom_widgets/custom_bottom_bar_in_video.dart';
import 'list_of_ingredients.dart';

class RecipeDetailsLoadedSuccess extends StatefulWidget {
  const RecipeDetailsLoadedSuccess({super.key});

  @override
  State<RecipeDetailsLoadedSuccess> createState() =>
      _RecipeDetailsLoadedSuccessState();
}

class _RecipeDetailsLoadedSuccessState
    extends State<RecipeDetailsLoadedSuccess> {
  bool _showFullText = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    var recipeData = BlocProvider.of<RecipeCubit>(context).recipeModel;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16, horizontal: 8),
            child: Text(
              " How to make ${recipeData!.title} ",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: widthScreen / 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(32),
                child: Image.network(
                  recipeData.imageUrl,
                ),
              ),

              Positioned(
                top: widthScreen / 3-20,
                right: widthScreen / 3,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.play_circle_outline,
                      size: widthScreen / 4,
                      color: Colors.white.withOpacity(.69),
                    ),
                    onPressed: () async {
                      final Uri youtubeUrl =
                          Uri.parse(recipeData.youtubeVideoUrl.toString());
                      await launchUrl(
                        youtubeUrl,
                        mode: LaunchMode.platformDefault,
                      );
                    },
                  ),
                ),
              ),
              CustomBottomBarInVideo(area: recipeData.area.toString())

            ],
          ),

          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8, start: 8),
            child: Text(
              "Description",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: widthScreen / 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  recipeData.desc.toString(),
                  maxLines: _showFullText ? 100: 6,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: widthScreen / 24,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showFullText = !_showFullText;
                    });
                  },
                  child: Text(
                    _showFullText ? 'Show Less' : 'Show More',
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ingredients",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: widthScreen / 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${BlocProvider.of<RecipeCubit>(context).ingredientList!.length} items",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: widthScreen / 24,
                    //fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          const ListOfIngredients(),
        ],
      ),
    );
  }
}



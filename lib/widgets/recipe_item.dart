
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:food_app/views/recipe_details_view.dart';
import '../constants.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key, required this.title, required this.imageUrl, required this.recipeId,});
final String title;
final String imageUrl;
final String recipeId;
  @override
  Widget build(BuildContext context) {
    double widthScreen=MediaQuery.of(context).size.width;
    double heightScreen=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
hoverColor: kPrimaryColor,
        borderRadius: BorderRadius.circular(32),
        splashColor: kPrimaryColor.withOpacity(.2),
        onTap: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  RecipeDetailsView(
            recipeId: recipeId,
          ),)
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: widthScreen,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(32),
                child: Stack(
                  children: [
                   Image.network(imageUrl,
                     height: heightScreen/3.6,
                      fit: BoxFit.fill,
                      width: widthScreen,
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          height: 70,
                      width: widthScreen,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.2)
                      ),
                    )),

                    Positioned(
                      left: 15,
                      bottom: 35,
                      child: Text("How to make $title",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: widthScreen/24,
                            fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                    ),
                    Positioned(
                        left: 10,
                        bottom: 10,
                        child:Row(
                          children: [
                            const Icon(Icons.timer_sharp,color: Colors.white,),
                            Text("  ${BlocProvider.of<RecipeCubit>(context).generateRandomTimeInMin()} min",

                              style: TextStyle(
                                  fontSize: widthScreen/28,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ) ,

                          ],
                        )
                    ),
                  ],),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

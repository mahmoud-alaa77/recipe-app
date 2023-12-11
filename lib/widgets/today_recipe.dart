import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/widgets/recipe_item.dart';
import '../cubits/category_cubit/category_cubit.dart';
import '../cubits/recipe_cubit/recipe_cubit.dart';
import '../models/recipe_model.dart';
import 'custom_widgets/custom_change_recipe_button.dart';
import 'custom_widgets/custom_loading_widget.dart';

class TodayRecipe extends StatefulWidget {
  const TodayRecipe({super.key});

  @override
  State<TodayRecipe> createState() => _TodayRecipeState();
}

class _TodayRecipeState extends State<TodayRecipe> {
  @override
  void initState() {
    BlocProvider.of<RecipeCubit>(context).getRecipeForToday();

    super.initState();
  }

  void changeRecipe() {
    setState(() {
      BlocProvider.of<RecipeCubit>(context).getRecipeForToday();
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return SizedBox(
      width: widthScreen,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            RecipeModel? recipeForToday =
                BlocProvider.of<RecipeCubit>(context).recipeModel;
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Find best recipes\nfor cooking",
                      style: TextStyle(
                        fontSize: widthScreen / 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF323643),
                      ),
                    ),
                    const Spacer(),
                    CustomChangeRecipeButton(
                      onPressed: () {
                        changeRecipe();
                      },
                    ),
                  ],
                ),
                RecipeItem(
                    title: recipeForToday!.title,
                    imageUrl: recipeForToday.imageUrl,
                    recipeId: recipeForToday.id),
              ],
            );
          } else if (state is CategoryFailure) {
            return SizedBox(
              width: widthScreen,
              height: heightScreen / 5,
            );
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}

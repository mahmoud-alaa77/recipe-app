import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:food_app/models/recipe_model.dart';
import 'package:food_app/widgets/custom_widgets/custom_loading_widget.dart';

import '../widgets/custom_widgets/custom_check_connection_widget.dart';
import '../widgets/recipe_item.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key, required this.categoryTitle});
  final String categoryTitle;

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecipeCubit>(context)
        .getRecipes(categoryName: widget.categoryTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryTitle),
          centerTitle: true,
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            if (state is RecipeSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  RecipeModel data = BlocProvider.of<RecipeCubit>(context)
                      .listOfRecipes![index];

                  return RecipeItem(
                    title: data.title,
                    imageUrl: data.imageUrl,
                    recipeId: data.id,
                  );
                },
                itemCount:
                    BlocProvider.of<RecipeCubit>(context).listOfRecipes!.length,
              );
            } else if (state is RecipeLoading) {
              return const CustomLoadingWidget();
            } else {
              return const CheckConnection();
            }
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:food_app/widgets/custom_widgets/custom_check_connection_widget.dart';
import 'package:food_app/widgets/custom_widgets/custom_loading_widget.dart';
import '../widgets/recipe_details_loaded_success.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key,  this.recipeId, });
  final String? recipeId;
  // final String? recipeName;

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RecipeCubit>(context)
        .getRecipeById(recipeId: widget.recipeId.toString());

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Recipe Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoading) {
              return const CustomLoadingWidget();
            } else if (state is RecipeSuccess) {
              return const RecipeDetailsLoadedSuccess();
            } else {
              return const CheckConnection();
            }
          },
        ),
      ),
    );
  }
}

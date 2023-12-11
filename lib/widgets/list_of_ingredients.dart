
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/recipe_cubit/recipe_cubit.dart';
import 'ingredient_item.dart';

class ListOfIngredients extends StatelessWidget {
  const ListOfIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var ingredientData =
        BlocProvider.of<RecipeCubit>(context).ingredientList![index];
        return IngredientItem(
          title: ingredientData.name.toString(),
          amount: ingredientData.amount.toString(),
        );
      },
      itemCount:
      BlocProvider.of<RecipeCubit>(context).ingredientList!.length,
    );
  }
}

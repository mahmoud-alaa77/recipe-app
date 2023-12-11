import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:food_app/models/ingredient_model.dart';
import 'package:food_app/models/recipe_model.dart';
import 'package:food_app/services/get%20_recipe_by_id.dart';
import 'package:food_app/services/get_recipes_in_one_category.dart';
import 'package:meta/meta.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this.recipesInOneCategoryService, this.recipeByIdService)
      : super(RecipeInitial());

  RecipesInOneCategoryService recipesInOneCategoryService;
  RecipeByIdService recipeByIdService;
  List<RecipeModel>? listOfRecipes;
  RecipeModel? recipeModel;
  List<IngredientModel>? ingredientList;

  getRecipes({required String categoryName}) async {
    emit(RecipeLoading());
    try {
      listOfRecipes = await recipesInOneCategoryService.getRecipes(
          url:
              "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName");
      emit(RecipeSuccess());
    } catch (e) {
      emit(RecipeFailure());
    }
  }

  getRecipeById({required String recipeId}) async {
    emit(RecipeLoading());
    try {
      recipeModel = await recipeByIdService.getRecipe(
          url:
              "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$recipeId");
      ingredientList = await recipeByIdService.getIngredient(
          url:
              "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$recipeId");
      emit(RecipeSuccess());
    } catch (e) {
      emit(RecipeFailure());
    }
  }

  getRecipeForToday() async {
    emit(RecipeLoading());
    try {
      recipeModel = await recipeByIdService.getRecipe(
          url:
          "https://www.themealdb.com/api/json/v1/1/random.php");
      ingredientList = await recipeByIdService.getIngredient(
          url:
          "https://www.themealdb.com/api/json/v1/1/random.php");
      emit(RecipeSuccess());
    } catch (e) {
      emit(RecipeFailure());
    }
  }
  int generateRandomTimeInMin() {
    Random random = Random();
    int min = 15;
    int max = 75;
    return min + random.nextInt(max - min + 1);
  }

  double generateRandomRate() {
    Random random = Random();
    double min = 2.0;
    double max = 5.0;
    double randomRate = min + random.nextDouble() * (max - min);
    return double.parse(randomRate.toStringAsFixed(1));
  }


}

import 'package:dio/dio.dart';
import 'package:food_app/models/recipe_model.dart';

class RecipesInOneCategoryService {
  Dio dio = Dio();

  Future<List<RecipeModel>> getRecipes({required String url}) async {
    var response = await dio.get(url);

    List jsonData = response.data["meals"];

    List<RecipeModel> listOfRecipes = [];

    for (int i = 0; i < jsonData.length; i++) {
      RecipeModel model = RecipeModel.fromJson(jsonData[i]);
      listOfRecipes.add(model);
    }

    return listOfRecipes;
  }
}

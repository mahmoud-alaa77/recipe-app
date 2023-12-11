

import 'package:dio/dio.dart';
import 'package:food_app/models/ingredient_model.dart';
import 'package:food_app/models/recipe_model.dart';


class RecipeForTodayService {

  Dio dio = Dio();

  Future<RecipeModel> getRecipe({required String url}) async {
    Response response = await dio.get(url);


    var jsonData = response.data["meals"][0];
    RecipeModel model = RecipeModel.fromJson(jsonData);
    return model;
  }
}
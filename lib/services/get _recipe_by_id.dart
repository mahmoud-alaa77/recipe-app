






import 'package:dio/dio.dart';
import 'package:food_app/models/ingredient_model.dart';
import 'package:food_app/models/recipe_model.dart';


class RecipeByIdService{

  Dio dio =Dio();

  Future<RecipeModel> getRecipe({required String url})async{
    Response response= await dio.get(url);


    var jsonData= response.data["meals"][0];
    RecipeModel model= RecipeModel.fromJson(jsonData);
    return model;
  }

  getIngredient({required String url})async{
    Response response= await dio.get(url);

    var jsonData= response.data["meals"][0];
    List<IngredientModel> ingredientList= [];

    for(int i=1;i<=20;i++){
      if(jsonData["strIngredient$i"] !=""){
      IngredientModel model=IngredientModel(name: jsonData["strIngredient$i"] , amount: jsonData["strMeasure$i"] );
      ingredientList.add(model );
    }else{
        break;
      }

    }
   return ingredientList;
  }
}
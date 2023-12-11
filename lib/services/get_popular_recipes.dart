//
//
//
//
//
// import 'package:dio/dio.dart';
// import 'package:food_app/models/category_model.dart';
// import 'package:food_app/models/recipe_model.dart';
//
//
// class PopularRecipesService{
//
//   Dio dio =Dio();
//
//   Future<List<RecipeModel>>getRecipes()async{
//     var response=
//     await dio.get("https://api.spoonacular.com/recipes/random?number=8&tags=dessert&apiKey=6567ad004d574d349137006a42cde22e");
//
//     List jsonData= response.data["recipes"];
//
//     List<RecipeModel> listOfRecipes=[];
//
//
//
//     for(int i=0;i<jsonData.length;i++) {
//       RecipeModel model = RecipeModel.fromJson(jsonData[i]);
//       listOfRecipes.add(model);
//     }
//     for(int i=0;i<listOfRecipes.length;i++){
//        print(listOfRecipes[i].title);
//      }
//     return listOfRecipes;
//   }
// }
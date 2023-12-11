


import 'package:dio/dio.dart';
import 'package:food_app/models/category_model.dart';

class AllCategoriesService{
  Dio dio=Dio();


  Future<List<CategoryModel>> getCategories({required String url})async{

    Response response=await dio.get(url);


    List jsonData=response.data["categories"];

    List<CategoryModel> categoriesList=[];

    for(int i=0;i<jsonData.length;i++){
      CategoryModel model=CategoryModel.fromJson(jsonData[i]);
      categoriesList.add(model);
    }


    return categoriesList;
  }

}
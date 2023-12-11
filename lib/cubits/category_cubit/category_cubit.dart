import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/category_model.dart';
import 'package:food_app/services/get_all_categories_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.allCategoriesService) : super(CategoryInitial());

 AllCategoriesService allCategoriesService;

   List<CategoryModel>? listOfCategories;


   getAllCategories()async{
     emit(CategoryLoading());

    try{
      listOfCategories= await allCategoriesService.getCategories(url:"https://www.themealdb.com/api/json/v1/1/categories.php");

      emit(CategorySuccess());
    }catch(e){
     // print(e.toString());
      emit(CategoryFailure());
    }


  }

}

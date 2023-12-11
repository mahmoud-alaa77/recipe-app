import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:food_app/views/recipe_details_view.dart';

class SearchTextField extends StatelessWidget {
   const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextField(

        onSubmitted: (value){
//BlocProvider.of<RecipeCubit>(context).getRecipeByName(name: value);
// Navigator.push(context, MaterialPageRoute(builder: (context) {
//   return  RecipeDetailsView(recipeName: value);
// },));

        },

        decoration: const InputDecoration(
         focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.all(Radius.circular(16)),
             borderSide: BorderSide(
             color: kPrimaryColor
           )
         ),
            border: OutlineInputBorder(

              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            prefixIcon: Icon(Icons.search),
            
            label: Text("Search recipes",
            style: TextStyle(
              color : Color(0xFF9AA0B4),
            ),)
        ),
      ),
    );
  }
}

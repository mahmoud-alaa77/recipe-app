

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';

import '../../constants.dart';

class CustomChangeRecipeButton extends StatelessWidget {
  const CustomChangeRecipeButton({super.key, this.onPressed});
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    //double heightScreen=MediaQuery.of(context).size.height;
    return   IconButton(
      onPressed: onPressed,
      icon: Icon(
        Icons.refresh_rounded,
        size: widthScreen/5,
        color: kPrimaryColor,
      ),
    );
  }
}

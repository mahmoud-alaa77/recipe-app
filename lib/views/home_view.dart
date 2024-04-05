import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_widgets/custom_category_list_view.dart';

import '../widgets/today_recipe.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RECIPE ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "APP",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
            ],
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            children: [

              const TodayRecipe(),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 16),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: widthScreen / 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF323643),
                  ),
                ),
              ),
              const CustomCategoryListView(),
            ],
          ),
        ),
      ),
    );
  }
}

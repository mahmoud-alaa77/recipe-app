import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/cubits/category_cubit/category_cubit.dart';
import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';
import 'package:food_app/services/get%20_recipe_by_id.dart';
import 'package:food_app/services/get_all_categories_service.dart';
import 'package:food_app/services/get_recipes_in_one_category.dart';
import 'package:food_app/simple_bloc_observer.dart';
import 'package:food_app/views/welcome_view.dart';
void main() {
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double widthScreen=MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryCubit(AllCategoriesService()),),

        BlocProvider(create: (context) => RecipeCubit(RecipesInOneCategoryService(),RecipeByIdService()),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

         // colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,

        ),
        home:AnimatedSplashScreen(
            duration: 1000,
            animationDuration:const Duration(seconds: 1),
            splash: appLogo,
            splashIconSize: widthScreen/1.5,
            nextScreen: const WelcomeView(),
            splashTransition: SplashTransition.fadeTransition,
curve: Curves.decelerate,
            backgroundColor: Colors.black,
        ),
      ),
    );

  }
}
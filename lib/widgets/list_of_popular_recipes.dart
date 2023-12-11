//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/constants.dart';
// import 'package:food_app/cubits/recipe_cubit/recipe_cubit.dart';
// import 'package:food_app/widgets/recipe_item.dart';
//
// class PopularRecipesList extends StatefulWidget {
//   const PopularRecipesList({super.key});
//
//   @override
//   State<PopularRecipesList> createState() => _PopularRecipesListState();
// }
//
// class _PopularRecipesListState extends State<PopularRecipesList> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<RecipeCubit>(context).getRecipes();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     double widthScreen=MediaQuery.of(context).size.width;
//
//     return SizedBox(
//       width: widthScreen,
//       child: BlocBuilder<RecipeCubit, RecipeState>(
//         builder: (context, state) {
//           var data = BlocProvider.of<RecipeCubit>(context).listOfRecipes;
//           if(state is RecipeLoading){
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: kPrimaryColor,
//               ),
//             );
//           }else if(state is RecipeFailure){
//             return const Text("error");
//           }
//           else{
//             return  ListView.separated(
//               shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) => RecipeItem(
//                   title: data![index].title,
//                   imageUrl: data[index].imageUrl,
//                 ),
//                 separatorBuilder: (context, index) => const SizedBox(
//                   height: 12,
//                 ),
//                 itemCount: 5
//             );
//           }
//         },
//
//       )
//     );
//   }
// }

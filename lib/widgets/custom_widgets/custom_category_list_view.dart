import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubits/category_cubit/category_cubit.dart';
import 'package:food_app/widgets/custom_widgets/custom_loading_widget.dart';
import '../../views/recipes_view.dart';
import '../category_item.dart';
import 'custom_check_connection_widget.dart';

class CustomCategoryListView extends StatefulWidget {
  const CustomCategoryListView({super.key});

  @override
  State<CustomCategoryListView> createState() => _CustomCategoryListViewState();
}

class _CustomCategoryListViewState extends State<CustomCategoryListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryCubit>(context).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return SizedBox(
      width: widthScreen,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            return const ListOfCategoriesLoadedSuccess();
          } else if (state is CategoryFailure) {
            return const CheckConnection();
          } else {
            return Column(
              children: [
                SizedBox(
                  height: heightScreen / 4,
                ),
                const CustomLoadingWidget(),
              ],
            );
          }
        },
      ),
    );
  }
}

class ListOfCategoriesLoadedSuccess extends StatelessWidget {
  const ListOfCategoriesLoadedSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount:
          BlocProvider.of<CategoryCubit>(context).listOfCategories!.length - 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 16.0, // Spacing between columns
        mainAxisSpacing: 16.0, // Spacing between rows
      ),
      itemBuilder: (context, index) {
        var data =
            BlocProvider.of<CategoryCubit>(context).listOfCategories![index];
        return CategoryItem(
          imageUrl: data.imageUrl,
          categoryName: data.title,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipesView(
                  categoryTitle: data.title,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

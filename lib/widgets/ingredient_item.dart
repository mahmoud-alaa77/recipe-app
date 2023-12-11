import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key, required this.title, required this.amount});
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 8),
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 8),
      height: heightScreen <widthScreen ? heightScreen / 6 : heightScreen/14,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 5)
          ],
          color: Colors.white,
          borderRadius: const BorderRadiusDirectional.all(Radius.circular(16))),
      child: Row(
        children: [

          Text(
          "🍱   ",
            style: TextStyle(
                fontSize: widthScreen / 15, fontWeight: FontWeight.w500),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize:  widthScreen / 25, fontWeight: FontWeight.w500),
          ),
          const Spacer(
            flex: 2,
          ),
          Text(
            amount,
            style: TextStyle(
              color: Colors.grey,
              fontSize: widthScreen / 28,

            ),
          ),

        ],
      ),
    );
  }
}

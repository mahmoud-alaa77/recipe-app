import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryName,
      required this.imageUrl,
      this.onTap});
  final String categoryName;
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 5)
            ],
            color: Colors.white,
            borderRadius:
                const BorderRadiusDirectional.all(Radius.circular(24))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: widthScreen / 3,
              child: Image.network(
                imageUrl,

              ),
            ),
            Text(
              categoryName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../constants.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen=MediaQuery.of(context).size.width;

    return     GestureDetector(
      onTap: (){},
      child: Container(

          height: widthScreen/10,
          width: widthScreen/10,
          decoration: BoxDecoration(
            boxShadow:const [
              BoxShadow(
                color: kPrimaryColor,
                blurRadius: 5
              )
            ] ,
            //shape: BoxShape.circle,
            borderRadius: BorderRadiusDirectional.circular(16),
            color: kWhiteColor,
          ),

          child: const Icon(Icons.category_outlined,
            color: kPrimaryColor,

          )
      ),
    );
  }
}



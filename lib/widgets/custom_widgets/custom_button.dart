
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.title, required this.icon});
  final void Function()? onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    var widthScreen=MediaQuery.of(context).size.width;
    var heightScreen=MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width-100,
        height:heightScreen/12,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
            color: kPrimaryColor
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,style: TextStyle(
                fontSize: widthScreen/15,
                fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
            const SizedBox(
              width: 8,
            ),
            Icon(
              icon,
              color: Colors.white,
            size: widthScreen/13,
            )
          ],
        ),
      ),
    );
  }
}

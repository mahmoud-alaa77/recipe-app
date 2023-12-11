import 'package:flutter/material.dart';

class CustomIconWithTextWidget extends StatelessWidget {
  const CustomIconWithTextWidget(
      {super.key, required this.text, required this.icon, required this.color});
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: widthScreen / 12,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: widthScreen / 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {

  final VoidCallback onTap;
  final String icon;
  final double height;
  final double width;

  const ButtonBack({ Key? key,
    required this.onTap,
    required this.icon,
    this.height = 48,
    this.width = 48
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(icon))),
      ),
    );
  }
}
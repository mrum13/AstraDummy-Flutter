import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final double width;
  final double height;
  final Color colorButton;
  final EdgeInsets margin;
  final Function() onPressed;

  const CustomButton({Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 48,
    this.margin = EdgeInsets.zero,
    this.colorButton = const Color(0xFFF03E4F),
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: colorButton,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          onPressed: onPressed,
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 16 , fontWeight: w700),
          )),
    );
  }
}

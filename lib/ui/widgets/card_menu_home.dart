import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardMenuHome extends StatelessWidget {

  final String image;
  final String title;
  final VoidCallback onTap;

  const CardMenuHome({ Key? key,
    required this.image,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(image: AssetImage(image)),
            )
          ),
          Text(title,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: w700
            ),)
        ],
      ),
    );
  }
}
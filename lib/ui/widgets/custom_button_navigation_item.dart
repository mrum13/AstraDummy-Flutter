import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final String title;
  final VoidCallback onTap;


  const CustomBottomNavigationItem({ Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    this.isSelected = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        color: kWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(imageUrl))),
            ),
            Text(title, 
              style: isSelected ? primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w700,
              ) : greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w700,
              ))
          ],
        ),
      ),
    );
  }
}
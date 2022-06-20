import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardMotor extends StatelessWidget {

  final String imageUrl;
  final String titleCard;
  final EdgeInsets margin;
  final VoidCallback onTap;


  const CardMotor({ Key? key,
    required this.imageUrl,
    required this.titleCard,
    this.margin = const EdgeInsets.only(left: 20), required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 82,
        margin: margin,
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
        decoration: BoxDecoration(
          border: Border.all(color: kGreyColor),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.network(imageUrl!='images kosong'?imageUrl.toString():'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),),
              ),
            ),
            const SizedBox(height: 10,),
            Text( 
              titleCard,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CardListDetailMotor extends StatelessWidget {

  final String imageUrl;
  final Function() onTap;

  const CardListDetailMotor({
    Key? key,
    required this.imageUrl,
    required this.onTap 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {onTap();},
      child: SizedBox(
        width: 136,
        height: 120,
        child: Image.network(
          imageUrl!='images kosong'?'https://personakonsumen.com/storage/images/'+imageUrl.toString():'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'
        ),
      ),
    );
  }
}

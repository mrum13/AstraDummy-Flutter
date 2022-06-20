import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardDokumenLearning extends StatelessWidget {

  final String title;
  final Function() onTap;

  const CardDokumenLearning({ Key? key, 
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: kBackgroundColor,                
              child: Text(title,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: w700
                ),),
            ),
            const Divider(),
        ],),
    );
  }
}
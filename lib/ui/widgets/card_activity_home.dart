import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardActivityHome extends StatelessWidget {
  
  final Color cardColor;
  final String title;
  final TextStyle titleColor;
  final String value;

  const CardActivityHome({Key? key,
    required this.cardColor,
    required this.title,
    required this.titleColor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 160,
      height: 113,
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleColor
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style:
                      blackTextStyle.copyWith(fontSize: 40, fontWeight: w500),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 11, bottom: 4),
                  child: Text(
                    'Customer',
                    style: greyTextStyle.copyWith(
                      fontWeight: w400,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardFeedback extends StatelessWidget {

  final String title;
  final String date;
  final Function() onTap;

  const CardFeedback({ Key? key,
    required this.title,
    required this.date,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: w700),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                              AssetImage('assets/icon_calendar.png')
                          )
                        ),
                      ),
                      Text(
                        date,
                        style: greyTextStyle.copyWith(
                          fontWeight: w400,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
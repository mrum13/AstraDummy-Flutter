import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardNewInfoHome extends StatelessWidget {

  final String image;
  final String title;
  final String date;
  final Function() onTap;

  const CardNewInfoHome({Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {onTap();},
      child: Container(
        color: kBackgroundColor,
          child: Column(
            children: [
              const Divider(),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Row(
                children: [
                  Visibility(
                    visible: image == 'default.jpg' ? false : true,
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Image.network(
                        'https://personakonsumen.com/storage/images/'+image,
                        width: 100,
                        height: 72, 
                      ),
                    ),
                    
                  ),
                  Expanded(
                    child: Column(
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
                                margin: const EdgeInsets.only(right: 8),
                                width: 16,
                                height: 16,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/icon_calendar.png'))),
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
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

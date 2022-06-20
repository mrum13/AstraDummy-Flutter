import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardDetailMotor extends StatelessWidget {

  final String content;
  final Function() onTap;

  const CardDetailMotor({Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 91,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: kLineColor),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage('assets/icon_check.png'),
                )),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,),
                ),
              ) 
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 30,),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: onTap,
                  child: Text('Lihat Penjelasan',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: w700,
                  )
              ),
                ),
              ),),
          )
        ],
      ),
    );
  }
}

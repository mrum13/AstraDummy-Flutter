import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CardModal extends StatelessWidget {

  final String icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final TextStyle textStyle;
  final Function() onPressModal;

  const CardModal({ Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.textStyle,
    required this.onPressModal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14))),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, left: 156, right: 156),
              height: 4,
              width: 48,
              color: kGreyColor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(icon))),
            ),
            Text(
              title,
              style: textStyle
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: w400),
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              title: buttonText,
              height: 40,
              onPressed: onPressModal,
            ),
          ],
        ),
      );
  }
}
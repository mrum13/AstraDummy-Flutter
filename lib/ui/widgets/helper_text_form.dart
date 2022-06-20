import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class HelperTextForm extends StatelessWidget {

  final String helperText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  HelperTextForm({ Key? key,
    required this.helperText,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          helperText,
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: w400,
          ),
        ),
        const SizedBox(height: 6,),
        TextFormField(
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: w400,
          ),
          obscureText: obscureText,
          controller: controller,
          cursorColor: kBlackColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: w400
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: kPrimaryColor)),
          ),
        )
      ],
    );
  }
}
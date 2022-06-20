import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class HelperTextFormLogin extends StatelessWidget {

  final String helperText;
  final String hintText;
  final bool obscureText;
  final String icon;
  final TextEditingController controller;

  const HelperTextFormLogin({Key? key,
    required this.helperText,  
    required this.hintText,
    required this.icon,
    this.obscureText = false, 
    required this.controller,
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
          cursorColor: kBlackColor,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Image.asset(icon, height: 24, width: 24),),
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

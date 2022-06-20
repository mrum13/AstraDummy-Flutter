import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class LogoAhm extends StatelessWidget {

  final Alignment alignment;

  const LogoAhm({Key? key,
    this.alignment = Alignment.centerRight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kPrimaryColor),
          image: const DecorationImage(image: AssetImage('assets/persona_logo.png'))),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LogoAfila extends StatelessWidget {
  const LogoAfila({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      height: 20,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img_afila.png'))),
    );
  }
}

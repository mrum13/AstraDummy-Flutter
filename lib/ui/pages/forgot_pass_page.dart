import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:astra/ui/widgets/logo_afila.dart';
import 'package:astra/ui/widgets/logo_ahm.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget logo() {
      return const LogoAhm();
    }

    Widget title(){
      return Text(
        'Lupa Kata Sandi',
        style: blackTextStyle.copyWith(
          fontSize: 18,
          fontWeight: w800,
        ),
      );
    }

    Widget subtitle() {
      return Text(
        'Kata sandi dapat direset dengan\nmenghubungi Admin Dealer atau Admin\nPusat.',
        style: paragraphTextStyle.copyWith(
          fontSize: 14,
          fontWeight: w400,
        ),
      );
    }

    Widget buttonBack(){
      return ButtonBack(
        icon: 'assets/icon_back_red.png',
        onTap: () {
          Navigator.pushNamed(context, '/');
        }
      );
    }

    Widget logoAfila(){
      return const LogoAfila();
    }

    Widget footer() {
      return Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonBack(),
              logoAfila(),
            ],
          ),
        ));
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logo(),
            const SizedBox(height: 85,),
            title(),
            const SizedBox(height: 24,),
            subtitle(),
            footer(),
          ],
        ),
      )),
    );
  }
}
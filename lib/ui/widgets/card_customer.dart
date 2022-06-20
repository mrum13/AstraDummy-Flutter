import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class CardCustomer extends StatelessWidget {

  final String name;
  final String date;
  final Function() ontap;

  const CardCustomer({Key? key,
    required this.name,
    required this.date,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget divider() {
      return Divider(
        height: 1,
        color: kLineColor,
      );
    }

    Widget helperContent() {
      return Row(
        children: [
          Expanded(
              child: Text(
            'Nama',
            style: greyTextStyle.copyWith(fontSize: 12, fontWeight: w400),
          )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            'Tanggal',
            style: greyTextStyle.copyWith(fontSize: 12, fontWeight: w400),
          ))
        ],
      );
    }

    Widget dataContent() {
      return Row(
        children: [
          Expanded(
              child: Text(
            name,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: w400),
          )),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            date,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: w400),
          ))
        ],
      );
    }

    Widget content() {
      return Column(
        children: [
          helperContent(),
          const SizedBox(height: 10,),
          dataContent(),
          const SizedBox(height: 16,),
        ],
      );
    }

    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          divider(),
          const SizedBox(
            height: 16,
          ),
          content(),
        ],
      ),
    );
  }
}

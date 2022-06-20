import 'package:astra/model/customer_model.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCustomerListPage extends StatefulWidget {

  final CustomerModel customer;
  const DetailCustomerListPage(this.customer, {Key? key}) : super(key: key);

  @override
  State<DetailCustomerListPage> createState() => _DetailCustomerListPageState();
}

class _DetailCustomerListPageState extends State<DetailCustomerListPage> {
  @override
  Widget build(BuildContext context) {

    String phone = widget.customer.phone;
    String jenisKelamin = (widget.customer.gender!="man"?'Perempuan':'Laki-laki');

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          'Detail Customer',
          style: blackTextStyle.copyWith(
            fontWeight: w800,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama', 
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.customer.name,
              style: blackTextStyle.copyWith(
                fontSize:16,
                fontWeight: w700
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.space,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jenis Kelamin',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: w400
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(jenisKelamin,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 110,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Umur',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: w400
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(widget.customer.age,
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Text('Pekerjaan',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.customer.job.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: w700,
              ),
            ),
            Visibility(
              // ignore: unnecessary_null_comparison
              visible: ((phone==null) | (phone=='62'))?false:true,
              child: Column(
                children: [
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No. Telepon', 
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: w400
                            ),
                          ),
                          const SizedBox(height: 10,),
                            Text(phone, 
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: w700
                            ),
                          ),
                        ],
                      ),
                      CustomButton(
                        title: 'Hubungi',
                        height: 40,
                        width: 135, 
                        onPressed: (){launch("tel:$phone");}
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            Text('Nama Produk',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.customer.product.name,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: w700,
              ),
            ),
          ],),
      );
    }

    Widget footer() {

      Widget backButton() {
      return ButtonBack(
        icon: 'assets/icon_back_orange.png',
        onTap: () {
          Navigator.pushNamed(context, '/customer-list');
        },
      );
    }

      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20),
          child: backButton()),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  const SizedBox(height: 24,),
                  content()
                ],
              ),
              footer()
            ],
          )),
      ),
    );
  }
}
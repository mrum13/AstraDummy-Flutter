import 'package:astra/model/product_model.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class DetailPromo extends StatefulWidget {
  final ProductModel product;
  
  const DetailPromo(this.product, {Key? key}) : super(key: key);

  @override
  State<DetailPromo> createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {
  @override
  Widget build(BuildContext context) {

    String baseLink = 'https://personakonsumen.com/storage/images/';

    String startDate = DateFormat('d').format(widget.product.promos[0].startDate).toString();
    String endDate = DateFormat('dd MMMM yyyy').format(widget.product.promos[0].endDate).toString();

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Detail Program',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget buttonBack() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: ButtonBack(
              onTap: () {
                Navigator.pushNamed(context, '/learning');
              },
              icon: 'assets/icon_back_orange.png'),
        ),
      );
    }

    Widget contentPromo(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   width: double.infinity,
          //   height: 128,
          //   child: Image.network(baseLink+widget.product.promos[0].image.name),
          // ),
          const SizedBox(height: 16,),
          Text(widget.product.promos[0].name,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: w700,
            ),
          ),
          const SizedBox(height: 15,),
          Text(startDate +'- '+endDate,
            style: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: w400,
            ),
          ),
          const SizedBox(height: 20,),
          HtmlWidget(widget.product.promos[0].desc),
          const SizedBox(height:20)
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              ListView(
                children: [
                  header(),
                  const SizedBox(height: 20,),
                  contentPromo()
                ],
              ),
              buttonBack()
            ],
          ),
        ),
      ),
    );
  }
}
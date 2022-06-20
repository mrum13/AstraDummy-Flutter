import 'package:astra/model/product_model.dart';
import 'package:astra/provider/product_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/learningPages/product/dimensi_product.dart';
import 'package:astra/ui/pages/learningPages/product/kapasitas_product.dart';
import 'package:astra/ui/pages/learningPages/product/kelistrikan_product.dart';
import 'package:astra/ui/pages/learningPages/product/mesin_product.dart';
import 'package:astra/ui/pages/learningPages/product/promo/detail_promo.dart';
import 'package:astra/ui/pages/learningPages/product/rangka_product.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class DetailProductLearningPage extends StatefulWidget {
  final ProductModel product;

  const DetailProductLearningPage(this.product, {Key? key}) : super(key: key);

  @override
  State<DetailProductLearningPage> createState() =>
      _DetailProductLearningPageState();
}

class _DetailProductLearningPageState extends State<DetailProductLearningPage> {
  String namaMotor = '';
  String fiturMotor = '';

  bool condition = false;

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    String baseLink = 'https://personakonsumen.com/storage/images/';

    List<Widget> list = widget.product.type.map((e) {
      String dataGambar = e.colorTypeModel.image.name;

      return GestureDetector(
        onTap: () {
          setState(() {
            condition = true;
            namaMotor = e.name.toString();
            fiturMotor = e.fitur.toString();
            productProvider.changeBorderColor();
          });
        },
        child: Container(
            margin: const EdgeInsets.only(right: 12),
            width: 136,
            height: 120,
            child: Image.network(dataGambar != 'images kosong'
                ? 'https://personakonsumen.com/storage/images/' +
                    dataGambar.toString()
                : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
            decoration: BoxDecoration(
                border: Border.all(color: productProvider.defaultBorderColor),
                borderRadius: BorderRadius.circular(4))),
      );
    }).toList();

    String promo = (widget.product.promos.isNotEmpty)
        ? widget.product.promos[0].name
        : 'tidak ada promo';
    // String promo = (widget.product.promos.isNotEmpty)?'ada promo':'tidak ada promo';

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Detail Produk',
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
                productProvider.resetBorderColor();
                namaMotor = '';
                fiturMotor = '';
                Navigator.pushNamed(context, '/learning');
              },
              icon: 'assets/icon_back_orange.png'),
        ),
      );
    }

    Widget listMotor() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: list,
        ),
      );
    }

    Widget tapBarWithView() {
      return DefaultTabController(
          length: 5,
          child: Column(
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TabBar(
                    isScrollable: true,
                    indicatorColor: kPrimaryColor,
                    unselectedLabelColor: kBlackColor,
                    labelColor: kPrimaryColor,
                    tabs: const <Widget>[
                      Tab(child: Text('Mesin')),
                      Tab(child: Text('Rangka & Kaki Kaki')),
                      Tab(child: Text('Dimensi Berat')),
                      Tab(child: Text('Kapasitas')),
                      Tab(child: Text('Kelistrikan')),
                    ]),
              ),

              ///tabview
              Container(
                color: const Color(0xFFE5E5E5),
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height,
                child: TabBarView(children: <Widget>[
                  MesinProduct(widget.product),
                  RangkaProduct(widget.product),
                  DimensiProduct(widget.product),
                  KapasitasProduct(widget.product),
                  KelistrikanProduct(widget.product),
                ]),
              ),
            ],
          ));
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            children: [
              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.product.name +
                              ' ' +
                              (condition
                                  ? namaMotor
                                  : widget.product.type[0].name),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: w700,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      listMotor(),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fitur Unggulan',
                              style: blackTextStyle.copyWith(
                                fontWeight: w700,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              (condition
                                  ? fiturMotor
                                  : widget.product.type[0].fitur),
                              style: blackTextStyle.copyWith(
                                fontWeight: w500,
                                fontSize: 14,
                              ),
                            ),
                          ]),
                      Visibility(
                        visible: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Sale Program',
                              style: blackTextStyle.copyWith(
                                fontWeight: w700,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                                onTap: promo != "tidak ada promo"
                                    ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPromo(widget.product),
                                          ),
                                        );
                                      }
                                    : null,
                                child: Text(promo)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Spesifikasi Motor',
                        style: blackTextStyle.copyWith(
                          fontWeight: w700,
                          fontSize: 14,
                        ),
                      ),
                      tapBarWithView(),
                    ],
                  )
                ],
              ),
              buttonBack(),
            ],
          ),
        )),
      ),
    );
  }
}

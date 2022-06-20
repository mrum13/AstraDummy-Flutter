import 'package:astra/model/knowladge_model.dart';
import 'package:astra/provider/product_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/addCustomerPages/detail_product_page.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:provider/provider.dart';

class DetailDokumenLearningPage extends StatefulWidget {
  final String fromWhere;
  final KnowladgeModel knowladge;
  
  const DetailDokumenLearningPage(
    this.knowladge,
    this.fromWhere, {Key? key}
  ) : super(key: key);

  @override
  State<DetailDokumenLearningPage> createState() => _DetailDokumenLearningPageState();
}

class _DetailDokumenLearningPageState extends State<DetailDokumenLearningPage> {

  @override
  Widget build(BuildContext context) {

    ProductProvider productProvider = Provider.of(context);

    String goBack = (widget.fromWhere=='learning')?'/learning':'no';

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Detail Dokumen',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            widget.knowladge.name,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: w700,
              ),
            ),
            const SizedBox(height: 20,),
            // Text(
            //   desc,
            //   style: blackTextStyle.copyWith(
            //     fontSize: 14,
            //     fontWeight: w400,
            //   ),
            // ),
            HtmlWidget(widget.knowladge.description)
          ],
        )
      );
    }

    Widget buttonBack() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: ButtonBack(
            onTap: () {
              (goBack=='/learning')?Navigator.pushNamed(context, '/learning'):
              productProvider.product.map((e) => Navigator.push(context,
          MaterialPageRoute(
            builder: (context) =>
                DetailProductPage(e),
          ),
        )
        ).toList();;
            },
            icon: 'assets/icon_back_orange.png'),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Stack(
            children: [
              ListView(
                children: [header(), content()],
              ),
              buttonBack()
            ],
          ),
        )),
      ),
    );
  }
}

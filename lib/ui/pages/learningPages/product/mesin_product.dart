import 'package:astra/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class MesinProduct extends StatefulWidget {
  final ProductModel product;
  
  const MesinProduct(this.product, {Key? key}) : super(key: key);

  @override
  State<MesinProduct> createState() => _MesinProductState();
}

class _MesinProductState extends State<MesinProduct> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HtmlWidget(widget.product.engine)
          ],
        )
      ),
    );
  }
}
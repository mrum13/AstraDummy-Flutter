import 'package:astra/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DimensiProduct extends StatefulWidget {
  final ProductModel product;
  
  const DimensiProduct(this.product, {Key? key}) : super(key: key);

  @override
  State<DimensiProduct> createState() => _DimensiProductState();
}

class _DimensiProductState extends State<DimensiProduct> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: HtmlWidget(widget.product.dimention)
      ),
    );
  }
}
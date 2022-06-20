import 'package:astra/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class RangkaProduct extends StatefulWidget {
  final ProductModel product;
  
  const RangkaProduct(this.product, {Key? key}) : super(key: key);

  @override
  State<RangkaProduct> createState() => _RangkaProductState();
}

class _RangkaProductState extends State<RangkaProduct> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: HtmlWidget(widget.product.body)
      ),
    );
  }
}
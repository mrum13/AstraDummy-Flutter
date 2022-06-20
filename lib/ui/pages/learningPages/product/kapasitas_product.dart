import 'package:astra/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class KapasitasProduct extends StatefulWidget {
  final ProductModel product;
  
  const KapasitasProduct(this.product, {Key? key}) : super(key: key);

  @override
  State<KapasitasProduct> createState() => _KapasitasProductState();
}

class _KapasitasProductState extends State<KapasitasProduct> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: HtmlWidget(widget.product.capacity)
      ),
    );
  }
}
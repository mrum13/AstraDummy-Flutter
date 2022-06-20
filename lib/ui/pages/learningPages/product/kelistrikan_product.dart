import 'package:astra/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class KelistrikanProduct extends StatefulWidget {
  final ProductModel product;
  
  const KelistrikanProduct(this.product, {Key? key}) : super(key: key);

  @override
  State<KelistrikanProduct> createState() => _KelistrikanProductState();
}

class _KelistrikanProductState extends State<KelistrikanProduct> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: HtmlWidget(widget.product.electirity)
      ),
    );
  }
}
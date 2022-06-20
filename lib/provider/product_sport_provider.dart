import 'package:astra/model/product_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductSportProvider with ChangeNotifier {
  List<ProductModel> _productModel= [];

  List<ProductModel> get product => _productModel;

  set product(List<ProductModel> product) {
    _productModel = product;
    notifyListeners();
  }

  Future<void> getProductSport({String idProduct = '3'}) async {
    try {
      List<ProductModel> products = (await ProductService().getProducts(token: SharedPreference.token.getString("token"), idProduct: idProduct));
      _productModel = products;
    } catch (e) {
      // print(e);
    }
  }
}
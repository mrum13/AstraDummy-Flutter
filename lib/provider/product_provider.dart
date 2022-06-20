import 'package:astra/model/product_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/product_service.dart';
import 'package:astra/shared/theme.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _productModel= [];

  Color _defaultBorderColor = kGreyColor;
  int _statusCodeBorder = 0;

  Color get defaultBorderColor => _defaultBorderColor;

  void changeBorderColor() {
    if(_statusCodeBorder==0){
      _statusCodeBorder = 1;
      // _defaultBorderColor = kPrimaryColor;
    } else {
      _statusCodeBorder = 0;
      _defaultBorderColor = kGreyColor;
    }
    
  }

  void resetBorderColor() {
    _statusCodeBorder = 0;
    _defaultBorderColor = kGreyColor;
  }

  List<ProductModel> get product => _productModel;

  set product(List<ProductModel> product) {
    _productModel = product;
    notifyListeners();
  }

  Future<void> getProduct({String idProduct = ''}) async {
    try {
      List<ProductModel> products = (await ProductService().getProducts(token: SharedPreference.token.getString("token"), idProduct: idProduct));
      _productModel = products;
    } catch (e) {
      // print(e);
    }
  }
}
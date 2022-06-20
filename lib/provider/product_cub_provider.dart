import 'package:astra/model/product_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/model/type_model.dart';
import 'package:astra/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductCubProvider with ChangeNotifier {
  List<ProductModel> _productModel= [];

  List<ProductModel> get product => _productModel;

  set product(List<ProductModel> product) {
    _productModel = product;
    notifyListeners();
  }

  List<TypeModel> _typeModel= [];

  List<TypeModel> get type => _typeModel;

  set type(List<TypeModel> type) {
    _typeModel = type;
    notifyListeners();
  }

  Future<void> getProductCub({String idProduct = '1'}) async {
    try {
      List<ProductModel> products = (await ProductService().getProducts(token: SharedPreference.token.getString("token"), idProduct: idProduct));
      _productModel = products;
    } catch (e) {
      // print(e);
    }
  }

  Future<void> getTypeProductCub({String idProduct = '1'}) async {
    try {
      List<TypeModel> typeProducts = (await ProductService().getTypeProducts(token: SharedPreference.token.getString("token"), idProduct: idProduct));
      _typeModel = typeProducts;
    } catch (e) {
      // print(e);
    }
  }
}
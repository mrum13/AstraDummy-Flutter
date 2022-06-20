import 'dart:convert';

import 'package:astra/model/product_model.dart';
import 'package:astra/model/type_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

   Future<List<ProductModel>> getProducts({required String token, required String idProduct}) async {
    var url = '$baseUrl/products?category_id=$idProduct';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('product all status code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }

  Future<List<TypeModel>> getTypeProducts({required String token, required String idProduct}) async {
    var url = '$baseUrl/products?category_id=$idProduct';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['types'];
      List<TypeModel> typeProducts = [];

      for (var item in data) {
        typeProducts.add(TypeModel.fromJson(item));
      }

      return typeProducts;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}

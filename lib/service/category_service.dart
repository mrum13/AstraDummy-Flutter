import 'dart:convert';

import 'package:astra/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

  Future<List<CategoryModel>> getCategory({required String token}) async {
    var url = '$baseUrl/categorys';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('Category status Code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<CategoryModel> categorys = [];

      for (var item in data) {
        categorys.add(CategoryModel.fromJson(item));
      }

      return categorys;
    } else {
      throw Exception('Gagal Get Category!');
    }
  }
}
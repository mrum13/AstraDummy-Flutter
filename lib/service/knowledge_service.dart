import 'dart:convert';

import 'package:astra/model/knowladge_model.dart';
import 'package:http/http.dart' as http;

class KnowledgeService {
  String baseUrl = 'https://personakonsumen.com/api/v1';
  
  Future<List<KnowladgeModel>> getKnowladge({required String token}) async {
    var url = '$baseUrl/knowledges';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('knowledge status code'+response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<KnowladgeModel> knowladges = [];

      for (var item in data) {
        knowladges.add(KnowladgeModel.fromJson(item));
      }

      return knowladges;
    } else {
      throw Exception('Gagal Get Knowledges!');
    }
  } 
}
import 'dart:convert';

import 'package:astra/model/priority_model.dart';
import 'package:http/http.dart' as http;

class PriorityService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

  Future<List<PriorityModel>> getPriority({required String token, required String age, required String jobId, required String gender}) async {
    var url = '$baseUrl/prioritys?age=$age&job_id=$jobId&gender=$gender';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('priority status code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<PriorityModel> prioritys = [];

      for (var item in data) {
        prioritys.add(PriorityModel.fromJson(item));
      }

      return prioritys;
    } else {
      throw Exception('Gagal Get Priority!');
    }
  }
}
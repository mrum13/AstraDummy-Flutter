import 'dart:convert';
import 'package:astra/model/information_model.dart';
import 'package:http/http.dart' as http;

class InformationService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

  Future<List<InformationModel>> getInformation({required String token, required String dealerId, required String length}) async {
    var url = '$baseUrl/informations/informationsbyDealer/$dealerId/and/$length';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('get information status code='+response.statusCode.toString());
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<InformationModel> informations = [];

      for (var item in data) {
        informations.add(InformationModel.fromJson(item));
      }

      return informations;
    } else {
      throw Exception('Gagal Get Informasi!');
    }
  }
}
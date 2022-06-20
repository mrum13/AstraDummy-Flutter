import 'dart:convert';

import 'package:astra/model/costumer_count_model.dart';
import 'package:http/http.dart' as http;

class CustomerCountService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

  Future<CustomerCountModel> getCustomerCount({
    required String token,
  }) async {
    var url = '$baseUrl/customers/data/customers';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'  
    };

    var response = await http.get( 
      Uri.parse(url),
      headers: header,
    );

    // print('getCustomerCount status code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      CustomerCountModel customer = CustomerCountModel.fromJson(data);
      return customer;
    } else {
      throw Exception('Gagal Login');
    }
    
  }
}
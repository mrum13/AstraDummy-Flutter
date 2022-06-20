import 'dart:convert';
import 'package:astra/model/user_model.dart';
import 'package:http/http.dart' as http;

import '../model/shared_preferece.dart';


class AuthService {
  // SharedPreferences? preferences;
  String baseUrl = 'https://personakonsumen.com/api/v1';
  String email = 'test email';

  // ignore: prefer_typing_uninitialized_variables
  var data;

  Future<UserModel> login({
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String device_name,
  }) async {
    var url = '$baseUrl/auth';
    var header = {'Accept': 'application/json'};
    var body = {
      'email': email,
      'password': password,
      'device_name': device_name,
    };

    var response = await http.post( 
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print('login status code='+response.statusCode.toString());
    
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      var user = await _getUser(token: data['token']);
      // await _getCustomerCount(token: data['token']);
      SharedPreference.token?.setString("token", data['token']);

      return user;
    } else {
      // print('status code adalah '+ response.statusCode.toString());
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> _getUser({
    required String token,
  }) async {
    var url = '$baseUrl/auth/checkAuth';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'  
    };

    var response = await http.get( 
      Uri.parse(url),
      headers: header,
    );

    print('getUser status code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.token = token;
      return user;
    } else {
      throw Exception('Gagal Login');
    }
    
  }

  Future<String> logout({required String token}) async {
    var url = '$baseUrl/auth';
    var header = {'Accept': 'application/json','Authorization': 'Bearer $token'};

    var response = await http.delete( 
      Uri.parse(url),
      headers: header,
    );

    // print('logout status code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      return 'berhasil logout';
    } else {
      throw Exception('Gagal Logout');
    }
  }
}
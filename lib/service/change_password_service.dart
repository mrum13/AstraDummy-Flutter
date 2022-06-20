import 'dart:convert';

import 'package:http/http.dart' as http;

class ChangePasswordService{
  String baseUrl = 'https://personakonsumen.com/api/v1';
  var data;

  Future changePass({
    required String token,
    required String passwordLama,
    required String passwordBaru,
  }) async {
    var url = '$baseUrl/user/change-password';
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'  
    };

    var body = {
      'password_lama': passwordLama,
      'password_baru': passwordBaru,
    };

    var response = await http.post( 
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print('change response status code:'+response.statusCode.toString());
    
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      var user = 'Password berhasil diubah';

      return user;
    } else {
      print('status code adalah '+ response.statusCode.toString());
      throw Exception('Gagal Ubah Password');
    }
  }
}
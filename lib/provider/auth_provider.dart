import 'package:astra/model/shared_preferece.dart';
import 'package:astra/model/user_model.dart';
import 'package:astra/service/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }


  Future<bool> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    try {
      UserModel user = (await AuthService().login(
        email: email,
        password: password,
        device_name: deviceName,
      )); 
      _user = user;

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      (await AuthService().logout(token: SharedPreference.token.getString("token"))); 
      
      return true;
    } catch (e) {
      return false;
    }
  }
}

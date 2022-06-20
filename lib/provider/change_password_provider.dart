import 'package:astra/model/change_password_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/change_password_service.dart';
import 'package:flutter/cupertino.dart';

class ChangePasswordProvider with ChangeNotifier {
  late ChangePasswordModel _change;

  ChangePasswordModel get change => _change;

  set change(ChangePasswordModel change) {
    _change = change;
    notifyListeners();
  }

  Future<bool> changePassword({
    required String passwordlama,
    required String passwordBaru,
  }) async {
    try {
      (await ChangePasswordService().changePass(
        passwordLama: passwordlama,
        passwordBaru: passwordBaru,
        token: SharedPreference.token.getString("token"),
      )); 

      return true;
    } catch (e) {
      print('return false');
      return false;
    }
  }
}
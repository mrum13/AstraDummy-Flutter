import 'package:astra/model/costumer_count_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/customer_count_service.dart';
import 'package:flutter/material.dart';

class CustomerCountProvider with ChangeNotifier {
  late CustomerCountModel _customerCount;

  CustomerCountModel get customerCount => _customerCount;

  set customerCount(CustomerCountModel customerCount) {
    _customerCount = customerCount;
    notifyListeners();
  }

  Future<void> getCustomerCount() async {
    try {
      CustomerCountModel customerCount = (await CustomerCountService().getCustomerCount(token: SharedPreference.token.getString("token")));
      _customerCount = customerCount;
    } catch (e) {
      // print(e);
    }
    notifyListeners();
  }
}
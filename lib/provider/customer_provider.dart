import 'package:astra/model/customer_model.dart';
import 'package:astra/service/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/shared_preferece.dart';

class CustomerProvider with ChangeNotifier {
  //untuk data list
  List<CustomerModel> _customerModel= [];

  List<CustomerModel> get customer => _customerModel;

  set customer(List<CustomerModel> customer) {
    _customerModel = customer;
    notifyListeners();
  }

  void addItem(List<CustomerModel> customer) {
    _customerModel.addAll(customer.toList());
    notifyListeners();
  }

  int _countPage = 1;

  int get countPage => _countPage;

  void resetCount() {
    _countPage = 1;
    notifyListeners();
  }

  void increamentPage() {
    if(customer == []) {
      _countPage=_countPage;
    } else {
      _countPage++;
    }
    notifyListeners();
  }

  void decreamentPage() {
    _countPage--;
    if(_countPage < 1) {
      _countPage = 1;
    }
    notifyListeners();
  }


  Future<void> getCustomer(String page) async {
    try {
      List<CustomerModel> customers = (await CustomerService().getCustomer(
        token: SharedPreference.token.getString("token"),
        page: page
      ));
      _customerModel = customers;
    } catch (e) {
      // print(e); 
    }
    notifyListeners();
  }

  Future<void> getCustomerBySearch(String name) async {
    try {
      List<CustomerModel> customers = (await CustomerService().getCustomerBySearch(
        token: SharedPreference.token.getString("token"),
        name: name,
      ));
      _customerModel = customers;
    } catch (e) {
      // print(e); 
    }
    notifyListeners();
  }

  Future<bool> addCustomer({
    required String name,
    required String usia,
    required String pekerjaan,
    required String phone,
    required String jenisKelamin, 
    required String priorityId,
    required String productId,
  }) async {
    try {
      (await CustomerService().addCustomer(
        name: name, 
        age: usia, 
        job: pekerjaan,
        phone: phone, 
        gender: jenisKelamin, 
        token: SharedPreference.token.getString("token"),
        priorityId: priorityId,
        productId: productId,
      )); 

      return true;
    } catch (e) {
      // print(e);
      // print('ada error customer provider');
      return false;
    }
  }
}
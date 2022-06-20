import 'dart:convert';
import 'package:astra/model/customer_model.dart';
import 'package:astra/model/job_model.dart';
import 'package:astra/model/product_customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerService {
  String baseUrl = 'https://personakonsumen.com/api/v1';
  // ignore: prefer_typing_uninitialized_variables
  var data;

  Future<List<CustomerModel>> getCustomer({required String token, required String page}) async {
    var url = '$baseUrl/customers/?page=$page';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    print('get customer status code = ' + response.statusCode.toString());


    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<CustomerModel> customers = [];

      if(data.isEmpty) {
        customers.add(
          CustomerModel(
            id: 0, 
            name: 'name', 
            phone: 'phone', 
            jobId: 'jobId', 
            gender: 'gender', 
            address: 'address', 
            job: JobModel(id:0, name: 'name'), 
            age: 'age', 
            createdAt: DateTime(0), 
            priorityId: 'priorityId', 
            productId: 'productId', 
            total: 'total', 
            product: ProductCustomerModel(id: 0,name: 'name')
          )
        );
      } else {
        for (var item in data) {
          customers.add(CustomerModel.fromJson(item));
        }
      }

      return customers;
    } else {
      throw Exception('Gagal Get Customer!');
    }
  } 

  Future<List<CustomerModel>> getCustomerBySearch({required String token, required String name}) async {
    var url = '$baseUrl/customers/search/$name';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('get customer search status code = ' + response.statusCode.toString());


    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      String total = jsonDecode(response.body)['total'].toString();
      data[0]['total'] = total;      

      List<CustomerModel> customers = [];
      
      for (var item in data) {
        customers.add(CustomerModel.fromJson(item));
      }

      return customers;
    } else {
      throw Exception('Gagal Get Customer Search!');
    }
  }

  Future<String> addCustomer({
    required String name,
    required String age,
    required String job,
    required String phone,
    required String gender,
    required String token,
    required String priorityId,
    required String productId,
  }) async {
    var url = '$baseUrl/customers';
    var header = {'Accept': 'application/json','Authorization': 'Bearer $token'};
    var body = {
      'name': name,
      'phone': phone,
      'age': age,
      'job_id': job,
      'gender': gender,
      'address': 'Masih kosong',
      'priority_id': priorityId,
      'product_id': productId,
    };

    var response = await http.post( 
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print('add customer status code='+response.statusCode.toString());

    if (response.statusCode == 201) {

      return 'Berhasil';
    } else {
      throw Exception('Gagal POST Customer!');
    }
  }
}
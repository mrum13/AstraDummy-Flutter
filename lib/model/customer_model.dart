import 'package:astra/model/job_model.dart';
import 'package:astra/model/product_customer_model.dart';

class CustomerModel{
  late int id;
  late String name;
  late String phone;
  late String jobId;
  late String gender;
  late String address;
  late JobModel job;
  late String age;
  late DateTime createdAt;
  late String priorityId;
  late String productId;
  late String total;
  late ProductCustomerModel product;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.jobId,
    required this.gender,
    required this.address,
    required this.job,
    required this.age,
    required this.createdAt,
    required this.priorityId,
    required this.productId,
    required this.total,
    required this.product,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'].toString();
    phone= json['phone'].toString();
    jobId= json['job_id'].toString();
    gender= json['gender'];
    address= json['address'];
    job = (json['job']!=null)?JobModel.fromJson(json['job']):
    JobModel(id: 0, name: 'tidak ada');
    createdAt= DateTime.parse(json['created_at']);
    productId= json['product_id'].toString();
    priorityId= json['priority_id'].toString();
    total = json['total'].toString();
    product = (json['product']!=null)?ProductCustomerModel.fromJson(json['product']):
    ProductCustomerModel(id: 1, name: 'tidak ada data');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'job_id': jobId,
      'gender': gender,
      'age': age,
      'address': address,
      'job': job.toJson(),
      'created_at': createdAt.toString(),
      'product_id': productId,
      'priority_id': priorityId,
      'total': total,
      'product': product,
    };
  }
}
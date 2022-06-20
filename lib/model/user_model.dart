import 'package:astra/model/dealer_model.dart';

class UserModel {
  late int id;
  late String nameTa;
  late String emailTa;  
  late String usernameTa;
  late String profilePhotoUrlTa;
  late String token;
  late String role;
  late String phone;
  late DealerModel dealer;

  UserModel({
    required this.id,
    required this.nameTa,
    required this.emailTa,
    required this.profilePhotoUrlTa,
    required this.token,
    required this.role,
    required this.phone,
    required this.dealer,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameTa = json['name'];
    emailTa = json['email'];
    role = json['role'];
    profilePhotoUrlTa = (json['image']!=null)?json['image']:'Tidak ada foto';
    phone = json['phone'];
    dealer= DealerModel.fromJson(json['dealer']);
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nameTa,
      'email': emailTa,
      'role' : role,
      'image': profilePhotoUrlTa,
      'token': token,
      'phone': phone,
      'dealer': dealer,
    };
  }

}


class DealerModel {
  late int id;
  late String name;
  late String address;
  late String phone;

  DealerModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone
  });

  DealerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
    };
  } 
}
class ProductCustomerModel {
  late int id;
  late String name;

  ProductCustomerModel({
    required this.id,
    required this.name,
  });

  ProductCustomerModel.fromJson(Map<String, dynamic> json) {
    id = (json['id']!=null)?json['id']:0;
    name = (json['name']!=null)?json['name']:'tidak ada nama produk';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
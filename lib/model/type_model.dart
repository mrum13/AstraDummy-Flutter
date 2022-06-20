import 'package:astra/model/color_type_model.dart';

class TypeModel{
  late int id;
  late String name;
  late String fitur;
  late int productId;
  late ColorTypeModel colorTypeModel;


  TypeModel({
    required this.id,
    required this.name,
    required this.productId,
    required this.colorTypeModel,
    required this.fitur
  });

  TypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    colorTypeModel = ColorTypeModel.fromJson(json['color']);
    fitur = (json['features']!=null)?json['features']:'tidak ada data';
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'product_id' : productId,
      'color' : colorTypeModel,
      'features' : fitur,
    };
  }
}
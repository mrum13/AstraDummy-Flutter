import 'package:astra/model/image_color_type.dart';

class ColorTypeModel{
  late int id;
  late String name;
  late int typeId;
  late ImageColorType image;

  ColorTypeModel({
    required this.id,
    required this.name,
    required this.typeId,
    required this.image
  });

  ColorTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    typeId = json['type_id'];
    image = ImageColorType.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name':name,
      'type_id':typeId,
      'image':image,
    };
  }
}
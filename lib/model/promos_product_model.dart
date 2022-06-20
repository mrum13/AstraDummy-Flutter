import 'package:astra/model/image_promo_model.dart';

class PromosProductModel{
  late int id;
  late String name;
  late String desc;
  late DateTime startDate;
  late DateTime endDate;

  PromosProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.startDate,
    required this.endDate,
  });

  PromosProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['description'];
    startDate = DateTime.parse(json['start_date']);
    endDate = DateTime.parse(json['end_date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': desc,
      'start_date': startDate,
      'end_date': endDate,
    };
  }
}
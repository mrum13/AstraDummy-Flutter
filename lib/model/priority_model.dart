import 'package:astra/model/knowladge_model.dart';

class PriorityModel {
  late List<KnowladgeModel>  knowledge = [];
  late int id;

  PriorityModel({
    required this.knowledge,
    required this.id,
  });

  PriorityModel.fromJson(Map<String, dynamic> json) {
    for (var item in json['knowledges']) {
      knowledge.add(KnowladgeModel.fromJson(item));
    }
    id = json['id'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'knowledges': knowledge,
      'id': id,
    };
  }
}
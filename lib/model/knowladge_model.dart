class KnowladgeModel {
  late int id;
  late String name;
  late String description;

  KnowladgeModel({
    required this.id,
    required this.name,
    required this.description,
  });

  KnowladgeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
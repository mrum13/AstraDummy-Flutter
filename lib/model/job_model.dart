class JobModel {
  late int id;
  late String name;

  JobModel({
    required this.id,
    required this.name,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
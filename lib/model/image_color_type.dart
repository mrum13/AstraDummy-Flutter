class ImageColorType {
  late int id;
  late String name;

  ImageColorType({
    required this.id,
    required this.name
  });

  ImageColorType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
    };
  }
}
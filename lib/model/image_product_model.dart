class ImageProductModel{
  late int id;
  late String name;

  ImageProductModel({
    required this.id,
    required this.name,
  });

  ImageProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = (json['name'].length>0)?json['name']:'images kosong';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
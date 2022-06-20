class InformationModel{
  late int id;
  late String title;
  late String description;
  late String image;
  late DateTime createdAt;

  InformationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
  });

  InformationModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      title = json['title'];
      description = json['description'];
      image = (json['image']!=null)?json['image']['name']:'default.jpg';
      createdAt= DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'created_at': createdAt.toString(),
    };
  }
}
class ImagePromoModel{
  late int id;
  late String name;

  ImagePromoModel({
    required this.id,
    required this.name,
  });

  ImagePromoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = (json['name'].length>0)?json['name']:'promo kosong';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
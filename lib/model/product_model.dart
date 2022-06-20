import 'package:astra/model/category_model.dart';
import 'package:astra/model/image_product_model.dart';
import 'package:astra/model/promos_product_model.dart';
import 'package:astra/model/type_model.dart';

class ProductModel{
  late int id;  
  late String name;
  late int categoryId;
  late List<ImageProductModel> images = [];
  late List<PromosProductModel> promos = []; 
  late String fitur;
  late String engine;
  late String body;
  late String dimention;
  late String capacity;
  late String electirity;
  late List<TypeModel> type = [];
  late CategoryModel category;

  ProductModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.images,
    required this.promos,
    required this.fitur,
    required this.engine,
    required this.body,
    required this.dimention,
    required this.capacity,
    required this.electirity,
    required this.type,
    required this.category
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    categoryId = json['category_id'];
    for (var item in json['images']) {
      images.add(ImageProductModel.fromJson(item));
    }
    for (var promo in json['promos']) {
      promos.add(PromosProductModel.fromJson(promo));
    } 
    fitur = (json['features']!=null)?json['features']:'tidak ada data';
    engine = json['engine'];
    body = json['body'];
    dimention = json['dimention'];
    capacity = json['capacity'];
    electirity = json['electirity'];
    for (var typenya in json['types']) {
      type.add(TypeModel.fromJson(typenya));
    } 
    category = CategoryModel.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'category_id' : categoryId,
      'images' : images,
      'promos' : promos,
      'features' : fitur,
      'engine' : engine,
      'body' : body,
      'dimention' : dimention,
      'capacity' : capacity,
      'electirity': electirity,
      'types': type,
      'category': category,
    };
  }
}
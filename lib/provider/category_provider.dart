import 'package:astra/model/category_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/category_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categoryModel = [];

  List<CategoryModel> get category => _categoryModel;

  set category(List<CategoryModel> category) {
    _categoryModel = category;
    notifyListeners();
  }

  Future<void> getCategory() async {
    try {
      List<CategoryModel> category = (await CategoryService().getCategory(token: SharedPreference.token.getString("token")));
      _categoryModel = category;
    // ignore: empty_catches
    } catch (e){
      
    } 
  }
}
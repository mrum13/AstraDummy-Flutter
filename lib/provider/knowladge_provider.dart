import 'package:astra/model/knowladge_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/knowledge_service.dart';
import 'package:flutter/material.dart';

class KnowladgeProvider with ChangeNotifier {
  List<KnowladgeModel> _knowladgeModel = [];

  List<KnowladgeModel> get knowladge => _knowladgeModel;

  set knowladge(List<KnowladgeModel> knowladge) {
    _knowladgeModel = knowladge;
    notifyListeners();
  }

  Future<void> getKnowladge() async {
    try {
      List<KnowladgeModel> knowladge = (await KnowledgeService().getKnowladge(token: SharedPreference.token.getString("token")));
      _knowladgeModel = knowladge;
    } catch (e) {
      // print(e);
    }
    notifyListeners();
  }
}
import 'package:astra/model/information_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/information_service.dart';
import 'package:flutter/material.dart';

class InformationProvider with ChangeNotifier {
  List<InformationModel> _informationModel= [];

  List<InformationModel> get information => _informationModel;

  set information(List<InformationModel> information) {
    _informationModel = information;
    notifyListeners();
  }

  Future<void> getInformation(String dealerId, String length) async {
    try {
      List<InformationModel> informations = (await InformationService().getInformation(
        token: SharedPreference.token.getString("token"),
        dealerId: dealerId,
        length: length,
      ));
      _informationModel = informations;
    } catch (e) {
      // print(e);
    }
    notifyListeners();
  }
}
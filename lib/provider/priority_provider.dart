import 'package:astra/model/priority_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/priority_service.dart';
import 'package:flutter/material.dart';

class PriorityProvider with ChangeNotifier {
  List<PriorityModel> _priorityModel = [];



  List<PriorityModel> get priority => _priorityModel;

  set priority(List<PriorityModel> priority) {
    _priorityModel = priority;
    notifyListeners();
  }

  Future<bool> getPriority({required String age, required String jobId, required String gender}) async {
    try {
      List<PriorityModel> priority = await PriorityService().getPriority(token: SharedPreference.token.getString("token"), age: age, jobId: jobId, gender: gender);
      _priorityModel = priority;
      if(_priorityModel.isEmpty){
        return false;
      }
      return true;
    } catch (e) {
      // print(e);
      return false;

    }
  }
}
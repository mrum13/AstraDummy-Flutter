import 'package:astra/model/job_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/job_service.dart';
import 'package:flutter/material.dart';

class JobProvider with ChangeNotifier {
  List<JobModel> _jobModel = [];

  List<JobModel> get job => _jobModel;

  set job(List<JobModel> job) {
    _jobModel = job;
    notifyListeners();
  }

  Future<void> getJob() async {
    try {
      List<JobModel> job = (await JobService().getJob(token: SharedPreference.token.getString("token")));
      _jobModel = job;
    } catch (e) {
      // print(e);
    }
  }
}
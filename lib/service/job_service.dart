import 'dart:convert';

import 'package:astra/model/job_model.dart';
import 'package:http/http.dart' as http;

class JobService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

  Future<List<JobModel>> getJob({required String token}) async {
    var url = '$baseUrl/jobs';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('Job status Code='+response.statusCode.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<JobModel> jobs = [];

      for (var item in data) {
        jobs.add(JobModel.fromJson(item));
      }

      return jobs;
    } else {
      throw Exception('Gagal Get Job!');
    }
  }
}
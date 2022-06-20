import 'dart:convert';
import 'package:astra/model/feedback_model.dart';
import 'package:http/http.dart' as http;

class FeedbackService {
  String baseUrl = 'https://personakonsumen.com/api/v1';

  Future<List<FeedbackModel>> getFeedback({required String token}) async {
    var url = '$baseUrl/feedback';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    // print('get feedback status code='+response.statusCode.toString());
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<FeedbackModel> feedback = [];

      for (var item in data) {
        feedback.add(FeedbackModel.fromJson(item));
      }

      return feedback;
    } else {
      throw Exception('Gagal Get Feedback !');
    }
  }

  Future<String> addFeedback({
    required String userId,
    required String perihal,
    required String feedback,
    required String token,
  }) async {
    var url = '$baseUrl/feedback';
    var header = {'Accept': 'application/json','Authorization': 'Bearer $token'};
    var body = {
      'id_user': userId,
      'perihal': perihal,
      'feedback': feedback,
    };

    var response = await http.post( 
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print('add feedback status code='+response.statusCode.toString());

    if (response.statusCode == 201) {

      return 'Berhasil';
    } else {
      throw Exception('Gagal POST Feedback!');
    }
  }
}
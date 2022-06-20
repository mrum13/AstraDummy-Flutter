import 'package:astra/model/feedback_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/service/feedback_service.dart';
import 'package:flutter/material.dart';

class FeedbackProvider with ChangeNotifier {
  List<FeedbackModel> _feedbackModel= [];

  List<FeedbackModel> get feedback => _feedbackModel;


  set feedback(List<FeedbackModel> feedback) {
    _feedbackModel = feedback;
    notifyListeners();
  }

  Future<void> getFeedback() async {
    try {
      List<FeedbackModel> feedbacks = (await FeedbackService().getFeedback(token: SharedPreference.token.getString("token")));
      _feedbackModel = feedbacks;
    } catch (e) {
      // print(e);
    }
    notifyListeners();
  }

  Future<bool> addFeedback({
    required String userId,
    required String perihal,
    required String feedback,
  }) async {
    try {
      (await FeedbackService().addFeedback(
        userId: userId, 
        perihal: perihal, 
        feedback: feedback,
        token: SharedPreference.token.getString("token"),
      )); 

      return true;
    } catch (e) {
      // print(e);
      // print('ada error feedback provider');
      return false;
    }
  }
}
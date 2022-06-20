class FeedbackModel {
   late int id;
  late DateTime createdAt;
  late int idUser;
  late String perihal;
  late String feedback;
  
  FeedbackModel({
    required this.id,
    required this.createdAt,
    required this.idUser,
    required this.perihal,
    required this.feedback
  });

  FeedbackModel.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      perihal = json['perihal'];
      feedback = json['feedback'];
      idUser = json['id_user'];
      createdAt= DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'perihal': perihal,
      'feedback': feedback,
      'id_user': idUser,
      'created_at': createdAt.toString(),
    };
  }
}
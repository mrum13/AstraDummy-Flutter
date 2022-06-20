class ChangePasswordModel {
  late String passLama;
  late String passBaru;

  ChangePasswordModel({
    required this.passLama,
    required this.passBaru,
  });

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    passLama = json['password_lama'];
    passBaru = json['password_baru'];
  }

  Map<String, dynamic> toJson() {
    return {
      'password_lama': passLama,
      'password_baru': passBaru,
    };
  }
}
import 'dart:convert';

class UserModel {
  String token;
  UserModel({
    required this.token,
  });
  

  Map<String, dynamic> toHeader() {
    return {
      'Authorization': 'Bearer ${token}'
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      token: map['token'] ?? '',
    );
  }
}

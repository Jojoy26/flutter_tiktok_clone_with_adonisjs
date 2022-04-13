import 'dart:convert';

class UserVideoModel {
  final int id;
  final String username;
  final String profileImage; 
  UserVideoModel({
    required this.id,
    required this.username,
    required this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'profile_image': profileImage,
    };
  }

  factory UserVideoModel.fromMap(Map<String, dynamic> map) {
    return UserVideoModel(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      profileImage: map['profile_image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserVideoModel.fromJson(String source) => UserVideoModel.fromMap(json.decode(source));
}

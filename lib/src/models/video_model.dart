import 'dart:convert';

import 'package:flutter_tik_tok/src/models/user_video_model.dart';

class VideoModel {
  final int id;
  final int userId;
  final String video;
  bool isLiked;
  int likeCount;
  final UserVideoModel user;
  VideoModel({
    required this.id,
    required this.userId,
    required this.video,
    required this.isLiked,
    required this.likeCount,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'video': video,
      'is_liked': isLiked,
      'likeCount': likeCount,
      'user': user.toMap(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id']?.toInt() ?? 0,
      userId: map['user_id']?.toInt() ?? 0,
      video: map['video'] ?? '',
      isLiked: map['is_liked'] ?? false,
      likeCount: map['likes'].length ?? 0,
      user: UserVideoModel.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) => VideoModel.fromMap(json.decode(source));
}

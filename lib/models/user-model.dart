import 'package:firebase_auth/firebase_auth.dart';
import 'package:whisperapp/services/user-services.dart';

import '../services/thought-post-services.dart';

final userName = initAuth();

class UserModel {
  String? id;
  String? name;
  final String? thought;
  Map? likes;
  String? postId;

  UserModel({
    this.id = '',
    this.likes,
    this.name,
    this.postId = '',
    this.thought,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'likes': "",
        'name': userName ?? 'Name not available',
        'postId': globalpostId,
        'thought': thought,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        likes: json["Likes"],
        name: json["name"] ?? 'Name not available',
        postId: json["postId"],
        thought: json["thought"],
      );
}

import 'package:whisperapp/services/user-services.dart';

final userName = initAuth();

class User {
  String id;
  String? name;
  final String thought;

  User({
    this.id = '',
    required this.name,
    required this.thought,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': userName,
        'thought': thought,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        thought: json["thought"],
      );
}

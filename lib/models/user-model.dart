class User {
  String id;
  final String thought;
  User({
    this.id = '',
    required this.thought,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'thought': thought,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        thought: json["thought"],
      );
}

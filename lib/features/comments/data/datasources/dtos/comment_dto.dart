import 'dart:convert';

class CommentDto {
  CommentDto({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  factory CommentDto.fromJson(String str) =>
      CommentDto.fromMap(json.decode(str));

  factory CommentDto.fromMap(Map<String, dynamic> json) => CommentDto(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  @override
  String toString() {
    return "{postId: $postId, id: $id, name: $name, email: $email, body: $body }";
  }
}

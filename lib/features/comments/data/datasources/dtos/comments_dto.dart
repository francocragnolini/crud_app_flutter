import 'dart:convert';

class CommentsDto {
  CommentsDto({
    required this.comments,
  });

  final List<_CommentDto> comments;

  factory CommentsDto.fromJson(String str) =>
      CommentsDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentsDto.fromMap(dynamic json) => CommentsDto(
      comments:
          List<_CommentDto>.from(json.map((x) => _CommentDto.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
      };
}

class _CommentDto {
  _CommentDto({
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

  factory _CommentDto.fromJson(String str) =>
      _CommentDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory _CommentDto.fromMap(Map<String, dynamic> json) => _CommentDto(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}

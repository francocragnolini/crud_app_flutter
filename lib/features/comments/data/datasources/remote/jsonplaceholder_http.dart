import 'package:flutter_jsonplaceholder_app/features/comments/data/datasources/dtos/comment_dto.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/data/datasources/dtos/comments_dto.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/domain/entities/comment_entity.dart';
import 'package:http/http.dart' as http;

class JsonPlaceHolderHttp {
  //singleton
  static final JsonPlaceHolderHttp _instance = JsonPlaceHolderHttp._internal();

  factory JsonPlaceHolderHttp() {
    return _instance;
  }

  JsonPlaceHolderHttp._internal();
  // singleton

  final _client = http.Client();
  final _scheme = "https";
  final _host = "jsonplaceholder.typicode.com";

  // Future<List<CommentDto>> getComments() async {
  //   try {
  //     final resp = await _client.get(
  //       Uri(scheme: _scheme, host: _host, path: "/comments"),
  //     );

  //     final commentsDto = CommentsDto.fromJson(resp.body);

  //     return commentsDto.comments;
  //   } catch (e) {
  //     throw (e.toString());
  //   }
  // }

  Future<List<Comment>> getComments() async {
    try {
      final resp = await _client.get(
        Uri(scheme: _scheme, host: _host, path: "/comments"),
      );

      final commentsDto = CommentsDto.fromJson(resp.body);

      final comments = commentsDto.comments
          .map((commentDto) => Comment(
              postId: commentDto.postId,
              id: commentDto.id,
              name: commentDto.name,
              email: commentDto.email,
              body: commentDto.body))
          .toList();

      // print("JsonPlaceHolder.dart:$comments");
      return comments;
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<Comment> getCommentById(String id) async {
    try {
      // get the data
      final resp = await _client.get(Uri(
        host: _host,
        path: "comments/$id",
        scheme: _scheme,
      ));

      // mapear data to object dto
      final commentDto = CommentDto.fromJson(resp.body);

      print("JsonPlaceHolder.dart:$commentDto");

      // mapear object dto to object entity
      return Comment(
          postId: commentDto.postId,
          id: commentDto.id,
          name: commentDto.name,
          email: commentDto.email,
          body: commentDto.body);
    } catch (e) {
      throw (e.toString());
    }
  }
}

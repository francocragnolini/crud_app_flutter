import 'package:flutter_jsonplaceholder_app/features/comments/data/repositories/comments_repository.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/domain/entities/comment_entity.dart';

class CommentsUsecase {
  static Future<List<Comment>> getAllComments() async {
    return await CommentsRespository.getAllComments();
  }

  // getCommentById() async {}
  static Future<Comment> getCommentById(String id) async {
    return await CommentsRespository.getCommentById(id);
  }

  static findCommentById({required String id, required List<Comment> items}) {
    return items.firstWhere((item) => item.id == id);
  }
}

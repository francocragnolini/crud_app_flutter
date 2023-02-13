import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/domain/entities/comment_entity.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/domain/usecases/comments_usecase.dart';

class CommentsProvider with ChangeNotifier {
  List<Comment> _comments = [];
  String selectedCommentId = "";

  // getter to a list of Comments
  List<Comment> get comments {
    return [..._comments];
  }

  // get all comments async operation
  Future<void> getAllComments() async {
    try {
      final commentsUsecase = await CommentsUsecase.getAllComments();
      _comments = commentsUsecase;
      notifyListeners();
    } catch (e) {
      throw (e.toString());
    }
  }

  // Opcions: fetch de data again or just search for the data we already got.
  Future<Comment> getCommentById() async {
    final comment = await CommentsUsecase.getCommentById(selectedCommentId);
    return comment;
  }

  selectComment(String id) {
    selectedCommentId = id;
    notifyListeners();
  }

  // ONE WAY OF DOING IT
  // find a product by id
  Comment findById() {
    return _comments
        .firstWhere((comment) => comment.id.toString() == selectedCommentId);
  }

  // Comment findCommentById(String id, List<Comment> comments) {
  //   return CommentsUsecase.findCommentById(id: id, items: _comments);
  // }
}

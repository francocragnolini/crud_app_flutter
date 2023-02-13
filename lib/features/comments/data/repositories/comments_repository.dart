import 'package:flutter_jsonplaceholder_app/features/comments/domain/entities/comment_entity.dart';
import '../datasources/remote/jsonplaceholder_http.dart';

class CommentsRespository {
  //get all comments
  static Future<List<Comment>> getAllComments() async {
    return await JsonPlaceHolderHttp().getComments();
  }

  static Future<Comment> getCommentById(String id) async {
    return JsonPlaceHolderHttp().getCommentById(id);
  }
}

// static:
// la ventaja de utilizar metodos estaticos es que permite acceder
// a ese metodo sin crear una instancia de la clase.
// se utiliza cuando otras clases necesitan acceso a una propiedad o metodo 
// de una clase
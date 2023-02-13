import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

import 'package:flutter_jsonplaceholder_app/features/comments/presentation/providers/comments_provider.dart';

import 'comment_detail_screen.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // PROVIDER COMMENTS
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const _Title(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 500,
              width: 700,
              color: Colors.amberAccent,
              // child: const _FutureBuilderComments(),
              child: _ListBuilder(),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  // METODO QUE HACE LA DECORACION DEL BOTON
  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFF0D47A1),
          Color(0xFF1976D2),
          Color(0xFF42A5F5),
        ],
      ),
    );
  }
}

// this is where the provider
class _ListBuilder extends StatefulWidget {
  @override
  State<_ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<_ListBuilder> {
  var _isInit = true;

  // a way of fetching data only once when the widget build for the firt time
  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<CommentsProvider>(context).getAllComments();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);

    log("CommentsScreen: $commentsProvider.comments");

    return ListView.builder(
      itemCount: commentsProvider.comments.length,
      itemBuilder: (context, index) {
        final comment = commentsProvider.comments[index];
        return GestureDetector(
          onTap: () {
            log(comment.id.toString());

            commentsProvider.selectComment(comment.id.toString());

            Navigator.of(context).pushNamed(
              DetailCommentScreen.routeName,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email: ${comment.id}"),
                Text("Email: ${comment.email}"),
                Text("PostId: ${comment.postId}"),
                Text("Description: ${comment.body}"),
                const Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}

// FUTURE BUILDER FUNCIONA
// class _FutureBuilderComments extends StatelessWidget {
//   const _FutureBuilderComments({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: FutureBuilder(
//         initialData: const <Comment>[],
//         future: CommentsUsecase.getAllComments(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               final comments = snapshot.data as List<Comment>;
//               return ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   final comment = comments[index];
//                   return GestureDetector(
//                     onTap: () {
//                       print("comment clicked");
//                       print(comment.id.toString());
//                       // Navigator.push(context, route);
//                       Navigator.of(context).pushNamed(
//                           DetailCommentScreen.routeName,
//                           arguments: comment.id.toString());
//                     },
//                     child: Column(
//                       children: [
//                         Text(
//                           "Email: ${comment.email}",
//                           textAlign: TextAlign.left,
//                         ),
//                         Text(
//                           "PostId: ${comment.postId}",
//                           textAlign: TextAlign.left,
//                         ),
//                         Text(
//                           "Description: ${comment.body}",
//                           textAlign: TextAlign.left,
//                         ),
//                         const Divider()
//                       ],
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return Container();
//             }
//           } else {
//             return const CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }

// TITLE
class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        "List of Comments",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

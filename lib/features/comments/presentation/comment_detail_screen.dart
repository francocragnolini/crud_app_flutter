import 'package:flutter/material.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/presentation/providers/comments_provider.dart';
import 'package:provider/provider.dart';

class DetailCommentScreen extends StatefulWidget {
  const DetailCommentScreen({super.key});

  static const routeName = "/detailcommentscreen";

  @override
  State<DetailCommentScreen> createState() => _DetailCommentScreenState();
}

class _DetailCommentScreenState extends State<DetailCommentScreen> {
  @override
  Widget build(BuildContext context) {
    // get the id from the path
    // final commentId = ModalRoute.of(context)?.settings.arguments as String;

    final comment = Provider.of<CommentsProvider>(context).getCommentById();

    return Scaffold(
      appBar: AppBar(title: const Text("Back")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: 500,
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Email: ${comment.email}",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "PostId: ${comment.postId}",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Description: ${comment.body}",
                        textAlign: TextAlign.left,
                      ),
                      const Divider()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

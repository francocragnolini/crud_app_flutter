import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_jsonplaceholder_app/features/comments/presentation/providers/comments_provider.dart';

import 'features/comments/presentation/comments_screen.dart';
import 'package:flutter_jsonplaceholder_app/features/comments/presentation/comment_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CommentsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CommentsScreen(),
        // agregar ruta SingleComment
        routes: {
          DetailCommentScreen.routeName: (context) =>
              const DetailCommentScreen(),
        },
      ),
    );
  }
}

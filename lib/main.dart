import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_demo/services/post_services.dart';

import 'bloc/post_bloc.dart';
import 'pages/post_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PostRepository repository = PostRepository();

    return MaterialApp(
      title: 'Flutter BLoC Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostBloc(repository),
        child: const PostListPage(),
      ),
    );
  }
}

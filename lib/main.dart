import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_demo/bloc/user_bloc.dart';
import 'package:rest_api_demo/services/api_services.dart';

import 'bloc/post_bloc.dart';
import 'pages/home_page.dart';

void main() {
  final Repository repository = Repository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostBloc(repository)),
        BlocProvider(create: (context) => UserBloc(repository))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BLoC',
      debugShowCheckedModeBanner: false,
      home: PostListPage(),
    );
  }
}

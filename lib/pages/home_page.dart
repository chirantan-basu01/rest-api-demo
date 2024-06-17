import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_demo/customWidgets/custom_button.dart';
import 'package:rest_api_demo/pages/users_page.dart';

import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts using Bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final posts = state.posts[index];
                return ListTile(
                  leading: Text(posts.id.toString()),
                  title: Text(posts.title ?? ''),
                  subtitle: Text(posts.body ?? ''),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(
                child: Text('Press the refresh button to fetch posts'));
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<PostBloc>().add(FetchPosts()),
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(
            text: "/users",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Users(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

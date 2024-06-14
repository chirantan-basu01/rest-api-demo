import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                return ListTile(
                  leading: Text(state.posts[index].id.toString()),
                  title: Text(state.posts[index].title ?? ''),
                  subtitle: Text(state.posts[index].body ?? ''),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Press the button to fetch posts'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PostBloc>().add(FetchPosts()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

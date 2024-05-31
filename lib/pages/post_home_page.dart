import 'package:flutter/material.dart';
import 'package:rest_api_demo/models/post_model.dart';
import 'package:rest_api_demo/services/post_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int perPage = 0;
  int limit = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Rest Api Demo"),
        backgroundColor: Colors.grey[200],
      ),
      body: FutureBuilder(
        future: PostServices.getProductData(perPage: perPage),
        builder: (context, AsyncSnapshot<List<PostList>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        snapshot.data?[index].id,
                        style: const TextStyle(fontSize: 18),
                      ),
                      title: Text(snapshot.data?[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                      subtitle: Text(snapshot.data?[index].body),
                    );
                  });
          }
        },
      ),
    );
  }
}

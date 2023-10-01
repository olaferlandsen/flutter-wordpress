import 'package:flutter_application_1/models/post_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/wordpress.dart';



List<PostModel> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
}

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Oh My Flutter!"),
        actions: [
           IconButton(
            icon: const Icon(Icons.help),
            tooltip: 'Acerca de...',
            onPressed: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
      body: FutureBuilder<List<PostModel>>(
        future: Wordpress.fetchPosts(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            List<PostModel> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].createdAt),
                  onTap:() => Navigator.pushNamed(context, '/post', arguments: {'id': posts[index].id}),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

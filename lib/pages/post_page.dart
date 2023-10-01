
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_application_1/services/wordpress.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class ScreenArguments {
  final int id;
  ScreenArguments(this.id);
}

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  

   @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Post..."),
      ),
       body: FutureBuilder<PostModel>(
        future: Wordpress.getPostById(args["id"]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PostModel post = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(post.title),
                  HtmlWidget(
                    post.content
                  ),
                ],
              ),
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

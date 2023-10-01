
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post_model.dart';
import 'package:flutter_application_1/services/wordpress.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Pagina..."),
      ),
       body: FutureBuilder<PostModel>(
        future: Wordpress.getPostBySlug("about"),
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

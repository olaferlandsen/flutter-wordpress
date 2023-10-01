import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/about.page.dart';
import 'package:flutter_application_1/pages/index_page.dart';
import 'package:flutter_application_1/pages/post_page.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/" : (ctx) => const IndexPage(),
        "/about" : (ctx) => const AboutPage(),
        "/post" : (ctx) => const PostPage()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black)
        // useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false
    ));
}
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PostsPages extends StatefulWidget {
  const PostsPages({Key? key}) : super(key: key);

  @override
  State<PostsPages> createState() => _PostsPagesState();
}

class _PostsPagesState extends State<PostsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Posts Page'),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}

import 'package:api_estudos_app/presentation/pages/post_page/controller/controller_post.dart';
import 'package:api_estudos_app/presentation/pages/post_page/widgets/menu_post_item.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsPages extends StatefulWidget {
  const PostsPages({Key? key}) : super(key: key);

  @override
  State<PostsPages> createState() => _PostsPagesState();
}

class _PostsPagesState extends State<PostsPages> {
  late final controllerPost = Provider.of<ControllerPost>(context);

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
          children: [
            _posts(),
          ],
        ),
      ),
    );
  }

  Widget _posts() {
    return FutureBuilder(
      future: controllerPost.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Erro ao carregar os dados'),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controllerPost.post.length,
            itemBuilder: (context, index) {
              final postIndex = controllerPost.post[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MenuPostItem(post: postIndex),
              );
            },
          );
        }
      },
    );
  }
}

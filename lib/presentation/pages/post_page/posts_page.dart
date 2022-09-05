import 'package:api_estudos_app/presentation/pages/controller/controller_app.dart';
import 'package:api_estudos_app/presentation/pages/post_page/widgets/menu_post_item.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsPages extends StatefulWidget {
  const PostsPages({
    Key? key,
    required this.colorAppBar,
  }) : super(key: key);

  final Color colorAppBar;

  @override
  State<PostsPages> createState() => _PostsPagesState();
}

class _PostsPagesState extends State<PostsPages> {
  late final controllerApp = Provider.of<ControllerApp>(context);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Posts Page',
        backgroundColor: widget.colorAppBar,
      ),
      body: _posts(),
    );
  }

  Widget _posts() {
    return FutureBuilder(
      future: controllerApp.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Erro ao carregar os dados'),
          );
        } else {
          return Scrollbar(
            controller: _scrollController,
            interactive: true,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 10,
            radius: const Radius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: controllerApp.post.length,
                itemBuilder: (context, index) {
                  final postIndex = controllerApp.post[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MenuPostItem(
                      post: postIndex,
                      colorAppBar: widget.colorAppBar,
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

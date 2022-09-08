import 'package:api_estudos_app/data/model/post.dart';
import 'package:api_estudos_app/presentation/pages/controller/controller_app.dart';
import 'package:api_estudos_app/presentation/pages/post_page/widgets/menu_post_item.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:api_estudos_app/presentation/widgets/custom_icon_button.dart';
import 'package:api_estudos_app/presentation/widgets/text_form_component_standard.dart';
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

  final TextEditingController _searchController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables
  var loadingPosts;

  @override
  void initState() {
    super.initState();
    loadingPosts =
        Provider.of<ControllerApp>(context, listen: false).getPosts();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  List<Post> searchPost() {
    final search = controllerApp.post.where((post) {
      final postTitle = post.title.toLowerCase();
      String postId = post.id.toString();
      final input = _searchController.value.text.toLowerCase();

      return postTitle.contains(input) || postId.contains(input);
    }).toList();

    return search;
  }

  @override
  Widget build(BuildContext context) {
    final post = searchPost();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Posts Page',
        backgroundColor: widget.colorAppBar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: _formKey,
                child: TextFormComponentStandard(
                  hintText: 'Search Post',
                  keyboardType: TextInputType.name,
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  preffix: const Icon(
                    Icons.search,
                  ),
                  suffix: _searchController.text.isNotEmpty
                      ? CustomIconButton(
                          iconData: Icons.close,
                          iconSize: 21,
                          onTap: () {
                            _searchController.clear();
                            setState(() {});
                          },
                        )
                      : null,
                ),
              ),
            ),
            post.isEmpty
                ? const Center(
                    child: Text('Nenhum dado encontrado!'),
                  )
                : SizedBox(height: 600, child: _posts()),
          ],
        ),
      ),
    );
  }

  Widget _posts() {
    final post = searchPost();
    return FutureBuilder(
      future: loadingPosts,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: post.length,
                itemBuilder: (context, index) {
                  final postIndex = post[index];
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

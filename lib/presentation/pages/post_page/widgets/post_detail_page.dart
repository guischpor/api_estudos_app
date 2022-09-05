import 'package:api_estudos_app/data/model/post.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:api_estudos_app/presentation/widgets/text_session.dart';
import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    Key? key,
    required this.post,
    required this.colorAppBar,
  }) : super(key: key);

  final Post post;
  final Color colorAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Post Detail Page ${post.id}',
        backgroundColor: colorAppBar,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextSession(
          title: 'UserId',
          content: '${post.userId}',
        ),
        const SizedBox(height: 20),
        TextSession(
          title: 'Id',
          content: '${post.id}',
        ),
        const SizedBox(height: 20),
        TextSession(
          title: 'Title',
          content: post.title,
        ),
        const SizedBox(height: 20),
        TextSession(
          title: 'Body',
          content: post.body,
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}

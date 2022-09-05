import 'package:api_estudos_app/data/model/post.dart';
import 'package:api_estudos_app/presentation/pages/post_page/widgets/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPostItem extends StatelessWidget {
  const MenuPostItem({
    Key? key,
    required this.post,
    required this.colorAppBar,
  }) : super(key: key);

  final Post post;
  final Color colorAppBar;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: const Color.fromARGB(255, 201, 220, 236),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Center(
            child: Text(
              '${post.id}',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          post.title,
          style: GoogleFonts.lato(),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
          color: Colors.indigo,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PostDetailPage(
                post: post,
                colorAppBar: colorAppBar,
              ),
            ),
          );
        },
      ),
    );
  }
}

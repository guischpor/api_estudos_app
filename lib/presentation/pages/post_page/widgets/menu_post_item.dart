import 'package:api_estudos_app/data/model/post.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPostItem extends StatelessWidget {
  const MenuPostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${post.id}'),
        subtitle: Text(
          post.title,
          style: GoogleFonts.lato(),
          overflow: TextOverflow.ellipsis,
        ),
        trailing:  const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
          color: Colors.indigo,
        ),
        onTap: () {
          
        },
      ),
    );
  }
}

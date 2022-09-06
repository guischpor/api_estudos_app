import 'package:api_estudos_app/data/model/photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuItemPhoto extends StatefulWidget {
  const MenuItemPhoto({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  State<MenuItemPhoto> createState() => _MenuItemPhotoState();
}

class _MenuItemPhotoState extends State<MenuItemPhoto> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.photo.url,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text('${widget.photo.id}'),
        ],
      ),
    );
  }
}

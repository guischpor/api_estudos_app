import 'dart:convert';

import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:api_estudos_app/data/model/photo.dart';
import 'package:api_estudos_app/data/model/post.dart';
import 'package:flutter/widgets.dart';

class ControllerApp extends ChangeNotifier {
  final ClientHttp clientHttp;

  ControllerApp(
    this.clientHttp,
  );

  final List<Post> _post = [];
  List<Post> get post => [..._post];

  final List<Photo> _photo = [];
  List<Photo> get photo => [..._photo];

  Future getPosts() async {
    _post.clear();

    final response =
        await clientHttp.get(url: 'https://jsonplaceholder.typicode.com/posts');

    List<dynamic> data = jsonDecode(response.body);

    for (var item in data) {
      _post.add(Post(
        userId: item['userId'],
        id: item['id'],
        title: item['title'],
        body: item['body'],
      ));
    }
  }

  Future getPhotos() async {
    _photo.clear();

    final response = await clientHttp.get(
        url: 'https://jsonplaceholder.typicode.com/photos');

    List<dynamic> data = jsonDecode(response.body);

    for (var item in data) {
      _photo.add(Photo(
        albumId: item['albumId'],
        id: item['id'],
        title: item['title'],
        url: item['url'],
        thumbnailUrl: item['thumbnailUrl'],
      ));
    }
  }
}

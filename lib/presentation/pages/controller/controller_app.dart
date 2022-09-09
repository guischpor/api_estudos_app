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

  List<Post> _post = [];
  List<Post> get post => [..._post];

  List<Photo> _photo = [];
  List<Photo> get photo => [..._photo];

  Future<void> getPosts() async {
    _post.clear();

    final response =
        await clientHttp.get(url: 'https://jsonplaceholder.typicode.com/posts');

    List<dynamic> data = jsonDecode(response.body);
    _post = data.map(Post.fromJson).toList();
    notifyListeners();
  }

  Future<void> getPhotos() async {
    _photo.clear();

    final response = await clientHttp.get(
        url: 'https://jsonplaceholder.typicode.com/photos');

    List<dynamic> data = jsonDecode(response.body);
    _photo = data.map(Photo.fromJson).toList();
  }
}

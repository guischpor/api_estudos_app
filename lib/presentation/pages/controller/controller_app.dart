import 'dart:convert';

import 'package:api_estudos_app/core/exceptions/http_exceptions.dart';
import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:api_estudos_app/data/model/photo.dart';
import 'package:api_estudos_app/data/model/post.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

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

    Response response =
        await clientHttp.get(url: 'https://jsonplaceholder.typicode.com/posts');

    try {
      List<dynamic> data = jsonDecode(response.body);
      _post = data.map(Post.fromJson).toList();
      notifyListeners();
    } on HttpException catch (error) {
      String mensagem = error.msg;
      mensagem = 'Error';
      debugPrint(mensagem);
      debugPrint(error.statusCode.toString());
    }
  }

  Future<void> getPhotos() async {
    _photo.clear();

    Response response = await clientHttp.get(
        url: 'https://jsonplaceholder.typicode.com/photos');

    List<dynamic> data = jsonDecode(response.body);
    _photo = data.map(Photo.fromJson).toList();
  }
}

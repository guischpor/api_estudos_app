import 'dart:convert';

import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:api_estudos_app/data/model/cep.dart';
import 'package:api_estudos_app/data/model/photo.dart';
import 'package:api_estudos_app/data/model/post.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../../../core/exceptions/http_exceptions.dart';

class ControllerApp extends ChangeNotifier {
  final ClientHttp clientHttp;

  ControllerApp(
    this.clientHttp,
  );

  List<Post> _post = [];
  List<Post> get post => [..._post];

  List<Photo> _photo = [];
  List<Photo> get photo => [..._photo];

  Cep cep = Cep();

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

    try {
      List<dynamic> data = jsonDecode(response.body);
      _photo = data.map(Photo.fromJson).toList();
    } on HttpException catch (error) {
      String mensagem = error.msg;
      mensagem = 'Error';
      debugPrint(mensagem);
      debugPrint(error.statusCode.toString());
    }
  }

  Future<Cep> getCEP(String cep) async {
    var url = 'https://viacep.com.br/ws/$cep/json/';
    Response response = await clientHttp.get(url: url);

    if (response.statusCode == 200) {
      notifyListeners();
      return Cep.fromJson(response.body);
    } else {
      notifyListeners();
      throw Exception('CEP não encontrado');
    }
  }
}

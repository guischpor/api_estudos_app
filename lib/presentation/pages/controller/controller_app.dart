import 'dart:convert';

import 'package:api_estudos_app/core/exceptions/http_exceptions.dart';
import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:api_estudos_app/data/model/cep.dart';
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

  // ignore: prefer_final_fields
  List<Cep> _cep = [];
  List<Cep> get cep => [..._cep];

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

  Future<void> getCEP(String cep) async {
    _cep.clear();

    var url = 'https://viacep.com.br/ws/$cep/json/';
    Response response = await clientHttp.get(url: url);

    try {
      Map<String, dynamic> data = jsonDecode(response.body);
      _cep.add(Cep.fromMap(data));
      notifyListeners();
    } on HttpException catch (e) {
      _cep.clear();
      notifyListeners();
      String mensagem = e.msg;
      mensagem = 'Erro ao buscar o endereço!';
      debugPrint(mensagem);
      debugPrint(e.statusCode.toString());
    }
  }

  void clearCep() {
    return _cep.clear();
  }
}

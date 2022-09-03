import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:flutter/widgets.dart';

class ControllerPost extends ChangeNotifier {
  final ClientHttp clientHttp;

  ControllerPost(
    this.clientHttp,
  );
}

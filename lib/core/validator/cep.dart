import 'package:api_estudos_app/core/services/value_object.dart';

class CEP implements ValueObject {
  final String _value;

  CEP(this._value);

  @override
  String? validator([Object? object]) {
    if (_value.trim().isEmpty) {
      return 'CEP Obrigatório!';
    }

    if (_value.trim().length < 8) {
      return 'O CEP deve ter 8 caracteres!';
    }
    return null;
  }
}

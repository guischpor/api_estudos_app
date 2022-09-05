import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:api_estudos_app/presentation/pages/controller/controller_app.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvidersList {
  final List<SingleChildWidget> providers = [
    Provider(
      create: (_) => ClientHttp(),
    ),
    ChangeNotifierProvider(
      create: (context) => ControllerApp(context.read()),
    ),
    
  ];
}

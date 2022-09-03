import 'package:api_estudos_app/core/services/client_http.dart';
import 'package:api_estudos_app/presentation/pages/post_page/controller/controller_post.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvidersList {
  final List<SingleChildWidget> providers = [
    Provider(
      create: (_) => ClientHttp(),
    ),
    ChangeNotifierProvider(
      create: (context) => ControllerPost(context.read()),
    ),
    
  ];
}

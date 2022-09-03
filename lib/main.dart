import 'package:api_estudos_app/core/provider/providers_list.dart';
import 'package:api_estudos_app/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final list = ProvidersList();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: list.providers,
      child: MaterialApp(
        title: 'App Estudo API',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: const ColorScheme.light(
            surfaceTint: Colors.white,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

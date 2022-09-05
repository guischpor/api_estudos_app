import 'package:api_estudos_app/presentation/pages/controller/controller_app.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({
    Key? key,
    required this.colorAppBar,
  }) : super(key: key);

  final Color colorAppBar;

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  late final controllerApp = Provider.of<ControllerApp>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Photos Page',
        backgroundColor: widget.colorAppBar,
      ),
      body: _photos(),
    );
  }

  Widget _photos() {
    return FutureBuilder(
      future: controllerApp.getPhotos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Erro ao carregar os dados'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              shrinkWrap: true,
              itemCount: controllerApp.photo.length,
              itemBuilder: (context, index) {
                final photoIndex = controllerApp.photo[index];
                return Column(
                  children: [
                    Image.network(
                      photoIndex.url,
                      fit: BoxFit.cover,
                    )
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}

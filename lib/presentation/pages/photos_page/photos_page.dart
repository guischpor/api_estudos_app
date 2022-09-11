import 'package:api_estudos_app/presentation/pages/controller/controller_app.dart';
import 'package:api_estudos_app/presentation/pages/photos_page/widgets/menu_item_photo.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final ScrollController _scrollController = ScrollController();

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
          return Center(
            child: CircularProgressIndicator(
              color: widget.colorAppBar,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: GoogleFonts.lato(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return Scrollbar(
            controller: _scrollController,
            interactive: true,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 10,
            radius: const Radius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                shrinkWrap: true,
                itemCount: controllerApp.photo.length,
                itemBuilder: (context, index) {
                  final photoIndex = controllerApp.photo[index];
                  return MenuItemPhoto(photo: photoIndex);
                },
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:api_estudos_app/presentation/pages/home_page/widgets/menu_page.dart';
import 'package:api_estudos_app/presentation/pages/photos_page/photos_page.dart';
import 'package:api_estudos_app/presentation/pages/post_page/posts_page.dart';
import 'package:api_estudos_app/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Home Page'),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MenuPage(
              iconData: Icons.text_snippet,
              title: 'Post Page',
              color: Colors.indigoAccent[400],
              splashColor: Colors.indigoAccent[900],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PostsPages(
                      colorAppBar: Colors.indigoAccent[400]!,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 15),
            MenuPage(
              iconData: Icons.photo_album,
              title: 'Photos Page',
              color: Colors.redAccent[400],
              splashColor: Colors.redAccent[900],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhotosPage(
                      colorAppBar: Colors.redAccent[400]!,
                    ),
                  ),
                );
              },
            ),
            // const SizedBox(height: 15),
            // const ImageGoogleDrive(
            //   imageUrl: '1Pijjg__QrXAWoZI7G51ohR2Nx4HrnF7S',
            //   width: 300,
            //   fit: BoxFit.cover,
            // )
          ],
        ),
      ),
    );
  }
}

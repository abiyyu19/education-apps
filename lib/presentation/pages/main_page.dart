import 'package:education_app/presentation/pages/contact/contact_page.dart';
import 'package:education_app/presentation/pages/map/map_page.dart';
import 'package:education_app/presentation/pages/media/media_page.dart';
import 'package:education_app/presentation/pages/profile/profile_page.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageList = [
      const ProfilePage(),
      const MapPage(),
      const ContactPage(),
      const MediaPage(),
    ];

    return Consumer<AppProvider>(
      builder: (context, value, _) => Scaffold(
        body: pageList[value.pageIndex],
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(milliseconds: 1000),
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            NavigationDestination(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Icon(Icons.contacts),
              label: 'Contact',
            ),
            NavigationDestination(
              icon: Icon(Icons.file_copy_outlined),
              label: 'Media',
            ),
          ],
          onDestinationSelected: (int index) {
            context.read<AppProvider>().changePageIndex(index);
          },
          selectedIndex: value.pageIndex,
          //backgroundColor: Colors.blue,
          //elevation: 10,
          //surfaceTintColor: Colors.lime,
          //height: 20,
          //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
      ),
    );
  }
}

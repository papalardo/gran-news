import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation_bar_controller.dart';

class SuperFaBottomNavigationBar extends StatelessWidget {
  const SuperFaBottomNavigationBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarController>( // init only first time
      builder: (s) => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Pesquisa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Perfil'),
          ),
        ],
        currentIndex: s.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => s.onItemTapped(index),
        /* currentIndex: Get.find<ProfileController>().selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: Get.find<ProfileController>().onItemTapped, */
      ),
    );
  }
}
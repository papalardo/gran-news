import 'package:app/global/controllers/auth_controller.dart';
import 'package:app/routes/routes.dart';
import 'package:app/screens/events_screen/events_screen.dart';
import 'package:app/screens/news_screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  AuthController _authController = Get.find<AuthController>();

  int _selectedIndex = 0;

  List<Widget> _screens = <Widget>[
    NewsScreen(),
    EventsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(() =>
          _authController.check.isTrue ? IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _authController.logout();
              setState(() {
                _selectedIndex = 0;
              });
            },
          ) : Container())
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Notícias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Eventos'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }

  void _onItemTapped(int index) {
    // Sei que isso pode melhorar, não me critique. KKKK
    if (_authController.check == false && index == 1) {
      Get.toNamed(AppRoutes.LOGIN);
      Get.snackbar('Opa.', 'Faça login antes de continuar..',
          duration: Duration(seconds: 5));
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }
}

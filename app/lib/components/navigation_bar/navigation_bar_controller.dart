import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  final _selectedIndex = 0.obs;
  set selectedIndex(value) => this._selectedIndex.value = value;
  get selectedIndex => this._selectedIndex.value;

  onItemTapped(int index) {
    this.selectedIndex = index; // The set method is accessed this way, you have confused it with methods.
  }
}
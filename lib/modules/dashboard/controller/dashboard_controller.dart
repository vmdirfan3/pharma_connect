import 'package:flutter/cupertino.dart';
import 'package:pharma_connect/modules/home/view/home_screen.dart';
import 'package:pharma_connect/modules/my_orders/view/my_orders_view.dart';
import 'package:pharma_connect/modules/profile/view/profile_view.dart';

class DashboardProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  List<Widget> screens = [
    const HomeScreen(),
    const MyOrdersScreen(),
    const Center(
      child: Text('Yet to design'),
    ),
    const ProfileView(),
  ];
}

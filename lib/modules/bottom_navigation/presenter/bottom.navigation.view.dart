import 'package:flutter/material.dart';
import '../../home/presenter/products/home.view.dart';

import '../../materials/presenter/home_material/materials.view.dart';
import '../../settings/presenter/settings.view.dart';
import '../custom_tab_bar/custom.tab.bar.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _actualPage = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };

  final List<Widget> _pages = [
    const HomeView(),
    const MaterialsView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNavigator(),
      bottomNavigationBar: CustomTabBar(
        onTabChange: (int tabIndex) {
          onTabTapped(tabIndex);
        },
      ),
    );
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_actualPage],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (_) => _pages.elementAt(_actualPage));
      },
    );
  }

  void onTabTapped(int index) {
    setState(() {
      if (_actualPage == index) {
        navigatorKeys[index]!.currentState?.popUntil((route) => route.isFirst);
      }
      _actualPage = index;
    });
  }
}

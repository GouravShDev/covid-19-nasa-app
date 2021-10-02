import 'package:covid_19_app/presentation/pages/covid_dashboard/covid_dashboard_page.dart';
import 'package:covid_19_app/presentation/pages/home_page/home_page.dart';
import 'package:covid_19_app/presentation/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  static const String route = "/home-navigator";

  const BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 1;

  Widget _getScreenFromIndex(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const CovidDashboard();
      case 1:
        return const HomePage();
      default:
        return const SettingPage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          child: Text(
            "Covid-19 App",
            style: TextStyle(
              fontFamily: 'Jokerman',
              color: Theme.of(context).primaryColor,
              fontSize: 28,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedIconTheme: IconThemeData(color: Colors.white, size: 30),
        unselectedIconTheme:
            IconThemeData(color: Colors.white.withOpacity(0.8)),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'COVID updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _getScreenFromIndex(_selectedIndex),
    );
  }
}

import 'package:covid_19_app/presentation/common_widgets/bottom_navigator.dart';
import 'package:covid_19_app/presentation/pages/covid_info/covid_info_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BottomNavigator.route:
        return MaterialPageRoute(
          builder: (context) => const BottomNavigator(),
        );
      case CovidInfoPage.route:
        return MaterialPageRoute(
          builder: (context) => const CovidInfoPage(),
        );

      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case SplashPage.route:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashPage(),
      //   );
      

      default:
        return null;
    }
  }
}

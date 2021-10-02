import 'package:covid_19_app/presentation/common_widgets/bottom_navigator.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'LeelawUI',
      ),
      home: MultiProvider(
        providers: [
          Provider(
            create: (context) => CustomThemeProps(),
          )
        ],
        child: BottomNavigator(),
      ),
    );
  }
}

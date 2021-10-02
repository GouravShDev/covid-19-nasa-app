import 'package:flutter/material.dart';

class CustomAppBar {
  AppBar customAppBar(BuildContext context) {
    return AppBar(
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
    );
  }
}

import 'package:flutter/material.dart';

class CustomThemeProps {
  final BoxShadow boxShadow = BoxShadow(
        color: Colors.grey.withOpacity(0.3),
            offset: Offset(0, 3),
            blurRadius: 6, // changes position of shadow
      );
}
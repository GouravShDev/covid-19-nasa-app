import 'dart:io';

import 'package:covid_19_app/data/datasource/remote_datasource.dart';
import 'package:covid_19_app/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:covid_19_app/presentation/common_widgets/bottom_navigator.dart';
import 'package:covid_19_app/providers/custom_theme_props.dart';
import 'package:covid_19_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomThemeProps(),
        )
      ],
      child: BlocProvider(
        create: (context) => HomeBloc(RemoteDataSources(http.Client())),
        child: MaterialApp(
          title: 'Covid 19 App',
          theme: ThemeData(
              primarySwatch: Colors.teal,
              fontFamily: 'LeelawUI',
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.teal),
              )),
          onGenerateRoute: AppRouter().onGenerateRoute,
        ),
      ),
    );
  }
}

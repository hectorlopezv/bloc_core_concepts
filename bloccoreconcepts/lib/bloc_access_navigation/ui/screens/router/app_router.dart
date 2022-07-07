import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/home_screen.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/second_screen.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            title: 'Home Screen',
            colors: Colors.blue,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => SecondScreen(
            title: 'Second',
            colors: Colors.red,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => ThirdScreen(
            title: 'Third',
            colors: Colors.green,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('404'),
          ),
        );
    }
  }
}

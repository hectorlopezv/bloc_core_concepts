import 'package:bloccoreconcepts/bloc_to_bloc_communication/ui/screens/home_screen.dart';
import 'package:bloccoreconcepts/bloc_to_bloc_communication/ui/screens/third_screen.dart';
import 'package:bloccoreconcepts/bloc_to_bloc_communication/ui/screens/second_screen.dart';
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
     
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('404'),
          ),
        );
    }
  }
}

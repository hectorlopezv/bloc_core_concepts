import 'package:bloccoreconcepts/bloc_access_navigation/logic/cubit/counter_cubit.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/home_screen.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/second_screen.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  void dispose() {
    _counterCubit.close();
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: 'Home Screen',
              colors: Colors.blue,
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(
              title: 'Second',
              colors: Colors.red,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(
              title: 'Third',
              colors: Colors.green,
            ),
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

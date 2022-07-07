import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/home_screen.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/logic/cubit/counter_cubit.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/second_screen.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(
                title: 'Home Screen',
                colors: Colors.blue,
              ),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                title: 'Second',
                colors: Colors.red,
              ),
            ),
        "/third": (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(
                title: 'Third',
                colors: Colors.green,
              ),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}

import 'package:bloccoreconcepts/bloc_access_navigation/logic/cubit/counter_cubit.dart';
import 'package:bloccoreconcepts/bloc_access_navigation/ui/screens/router/app_router.dart';
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
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}

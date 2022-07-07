import 'package:bloccoreconcepts/bloc_to_bloc_communication/logic/cubit/counter_cubit.dart';
import 'package:bloccoreconcepts/bloc_to_bloc_communication/logic/cubit/internet_cubit.dart';
import 'package:bloccoreconcepts/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final Color colors;
  final String title;
  const HomeScreen({Key? key, required this.colors, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text('Wifi');
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text('Mobile');
              } else if (state is InternetDisconnected) {
                return Text("Disconnected");
              }
              return CircularProgressIndicator();
            },
          ),
          Text(
            'You have pushed the button this many times:',
          ),
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented == true) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Incremented!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              } else if (state.wasIncremented == false) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Decremented!'),
                    duration: Duration(milliseconds: 300),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                  'BRR, NEGATIVE ' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              } else if (state.counterValue % 2 == 0) {
                return Text(
                  'YAAAY ' + state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              } else if (state.counterValue == 5) {
                return Text(
                  'HMM, NUMBER 5',
                  style: Theme.of(context).textTheme.headline4,
                );
              } else
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
            },
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/second");
            },
            child: Text('Go to Second Screen'),
            color: colors,
          ),
        ],
      ),
    );
  }
}

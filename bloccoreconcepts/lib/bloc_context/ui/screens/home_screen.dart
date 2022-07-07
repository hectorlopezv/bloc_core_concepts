import 'package:bloccoreconcepts/bloc_context/logic/cubit/counter_cubit.dart';
import 'package:bloccoreconcepts/bloc_context/logic/cubit/internet_cubit.dart';
import 'package:bloccoreconcepts/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final Color colors;
  final String title;
  const HomeScreen({Key? key, required this.colors, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext homeScreenContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
              Navigator.of(homeScreenContext).pushNamed("/second");
            },
            child: Text('Go to Second Screen'),
            color: colors,
          ),
          SizedBox(
            height: 24,
          ),

          Builder(builder: (context) {
            final counterState = context.watch<CounterCubit>().state;
            final internetState = context.watch<InternetCubit>().state;

            if (internetState is InternetConnected) {
              final connectionType = internetState.connectionType;
              if (internetState.connectionType == ConnectionType.Mobile) {
                return Text(
                  "Counter: ${counterState.counterValue} InternetConnection: Mobile",
                  style: Theme.of(context).textTheme.headline6,
                );
              }

              if (internetState.connectionType == ConnectionType.Wifi) {
                return Text(
                  "Counter: ${counterState.counterValue} InternetConnection: Wifi",
                  style: Theme.of(context).textTheme.headline6,
                );
              }
            }

            return SizedBox(
              height: 0,
            );
          }),
          SizedBox(
            height: 24,
          ),
          Builder(builder: (context) {
            final counterValue = context
                .select((CounterCubit cubit) => cubit.state.counterValue);
            return Text("Counter: $counterValue");
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: Text('${title}'),
                onPressed: () {
                 // BlocProvider.of<CounterCubit>(homeScreenContext).decrement();
                  homeScreenContext.read<CounterCubit>().decrement();
                  // context.bloc<CounterCubit>().decrement();
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: Text('${title} 2nd'),
                onPressed: () {
                  // BlocProvider.of<CounterCubit>(context).increment();
                  homeScreenContext.read<CounterCubit>().increment();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Builder(
            builder: (materialButtonContext) => MaterialButton(
              color: Colors.redAccent,
              child: Text(
                'Go to Second Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(materialButtonContext).pushNamed(
                  '/second',
                );
              },
            ),
          ),
          // SizedBox(
          //   height: 24,
          // ),
          MaterialButton(
            color: Colors.greenAccent,
            child: Text(
              'Go to Third Screen',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(homeScreenContext).pushNamed(
                '/third',
              );
            },
          ),
        ],
      ),
    );
  }
}

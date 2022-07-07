import 'package:flutter_bloc/flutter_bloc.dart';


enum CounterEvent { increment, decrement }
//initial state
//que functiones/Actions tiene
//No es un Stream
//Es parte de un BLOC
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}
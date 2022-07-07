import 'dart:async';

import 'package:bloccoreconcepts/bloc_to_bloc_communication/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetSubscriptionStream;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, wasIncremented: false)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetSubscriptionStream = internetCubit.stream.listen((state) {
    if (state is InternetConnected) {
      increment();
    } else if (state is InternetDisconnected) {
      decrement();
    }
  });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  Future<void> close() {
    internetSubscriptionStream.cancel();
    return super.close();
  }
}

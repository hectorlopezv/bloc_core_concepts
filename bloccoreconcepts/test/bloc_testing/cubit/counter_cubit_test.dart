import 'package:bloc_test/bloc_test.dart';
import 'package:bloccoreconcepts/bloc_testing/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        "the initial state for the  counter cubit if counterState(counterValue:0) have the same params",
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'emits counterState(counterValue: 1, wasIncremented: true) when increment Event is called.',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [
        CounterState(counterValue: 1, wasIncremented: true),
      ],
    );
    blocTest<CounterCubit, CounterState>(
      'emits counterState(counterValue: -1, wasIncremented: false) when decrement Event is called.',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [
        CounterState(counterValue: -1, wasIncremented: false),
      ],
    );
  });
}

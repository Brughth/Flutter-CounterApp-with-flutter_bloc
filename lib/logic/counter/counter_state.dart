part of 'counter_cubit.dart';

class CounterState {
  bool? wasIncrementd;
  int counterValue;
  CounterState({
    required this.counterValue,
    this.wasIncrementd,
  });
}

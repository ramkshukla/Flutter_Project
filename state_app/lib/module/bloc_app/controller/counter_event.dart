part of 'counter_bloc.dart';

abstract class CounterEvent {
  CounterEvent();
}

class Increment extends CounterEvent {
  Increment();
}

class Decrement extends CounterEvent {
  Decrement();
}

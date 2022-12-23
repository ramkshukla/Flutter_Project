part of 'counter_bloc.dart';

class CounterState {
  final int count;
  CounterState({
    this.count = 0,
  });

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }

  @override
  String toString() => '$count';
}

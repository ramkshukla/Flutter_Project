import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<Increment>(
      (event, emit) async {
        emit(
          state.copyWith(count: state.count + 1),
        );
      },
    );

    on<Decrement>(
      (event, emit) async {
        emit(
          state.copyWith(count: state.count - 1),
        );
      },
    );
  }
}

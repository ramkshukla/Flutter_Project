import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<DarkMode>(
      (event, emit) {
        emit(state.copyWith(themeButton: true));
      },
    );
    on<LightMode>(
      (event, emit) {
        emit(state.copyWith(themeButton: false));
      },
    );
  }
}

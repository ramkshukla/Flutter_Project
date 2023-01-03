part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class DarkMode extends ThemeEvent {
  DarkMode();
}

class LightMode extends ThemeEvent {
  LightMode();
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeState {
  final bool themeButton;
  ThemeState({
    this.themeButton = false,
  });

  ThemeState copyWith({
    bool? themeButton,
  }) {
    return ThemeState(
      themeButton: themeButton ?? this.themeButton,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'theme_button': themeButton,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeButton: map['themeButton'] as bool,
    );
  }

  @override
  String toString() => 'ThemeState(theme_button: $themeButton)';
}

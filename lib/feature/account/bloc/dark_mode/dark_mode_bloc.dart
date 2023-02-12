import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_dark_mode.dart';

class DarkModeBloc extends Bloc<DarkModeEvent, DarkModeState> {
  DarkModeBloc() : super(DarkModeInitial()) {
    on<ChangeDarkMode>((event, emit) async {
      try {
        emit(DarkModeLoading());
        if (event.darkMode) {
          themeMode = ThemeMode.dark;
        } else {
          themeMode = ThemeMode.light;
        }
        emit(DarkModeSuccess(darkMode: event.darkMode, themeMode: themeMode));
      } catch (e) {
        emit(DarkModeFailure(error: e.toString()));
      }
    });
  }

  ThemeMode themeMode = ThemeMode.light;
}

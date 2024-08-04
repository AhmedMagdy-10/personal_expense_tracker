import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/core/helper/cache_helper.dart';
import 'package:personal_expense_tracker/logic/cubit/start_view_states.dart';

class StartViewCubit extends Cubit<StartViewStates> {
  StartViewCubit() : super(StartInitialState());

  Locale? language;
  ThemeMode? themeMode;
  int currentIndex = 2;

  void changeLanguage(String lang) {
    CacheHelper.saveData(key: 'lang', value: lang).then((_) {
      language = Locale(lang);
      emit(ChangeLanguageState());
    });
  }

  void getlang() async {
    final savedLang = await CacheHelper.getSaveData(key: 'lang');
    final savedMode = await CacheHelper.getSaveData(key: 'mode');

    if (savedLang != null) {
      language = Locale(savedLang);
    }

    if (savedMode != null) {
      currentIndex = savedMode;

      themeMode = ThemeMode.system; // Default if not set
    }

    emit(ChangeSettingState());
  }

  void changeMode(int index) {
    currentIndex = index;
    CacheHelper.saveData(key: 'mode', value: currentIndex);
    if (index == 0) {
      themeMode = ThemeMode.light;
    } else if (index == 1) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }

    emit(ChangeModeState());
  }
}

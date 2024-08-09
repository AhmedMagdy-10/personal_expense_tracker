import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_expense_tracker/logic/cubit/homeCubit/home_cubit_states.dart';

class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit() : super(HomeInitialState());

  int currentIndex = 0;

  changeButtomPage(int index) {
    currentIndex = index;
    emit(ChangebuttomBarState());
  }
}

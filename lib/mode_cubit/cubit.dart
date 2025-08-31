import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/mode_cubit/state.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitialState());
  bool isDark = false;
  void changeMode(){
    isDark=!isDark;
    emit(ChangeModeState());
  }
  static AppCubit get(context)=>BlocProvider.of(context);

}

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/mode_cubit/state.dart';
import 'package:news_app/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(InitialState());
  bool isDark = false;
  void changeMode({bool? mode}){
    if(mode !=null) {
      isDark = mode;
      emit(ChangeModeState());
    }else {
      isDark = !isDark;
      CacheHelper.putDate('isDark', isDark).then((val){
        emit(ChangeModeState());
      });
    }


  }
  static AppCubit get(context)=>BlocProvider.of(context);

}

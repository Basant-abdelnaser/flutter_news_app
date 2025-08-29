import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';

class NewsCubit extends Cubit<NewStates>{
  NewsCubit():super(NewsInitialState());


  int currentIndex = 0;
  static NewsCubit get(context){
    return BlocProvider.of(context);
  }

  void  changeBottomNavBar( index){
    currentIndex=index;
    emit(ChangeBottomNavBarState());
  }


}

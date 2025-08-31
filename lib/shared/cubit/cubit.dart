import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/cubit/states.dart';



class NewsCubit extends Cubit<NewStates>{
  NewsCubit():super(NewsInitialState());


  int currentIndex = 0;
  List<dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];
  static NewsCubit get(context){
    return BlocProvider.of(context);
  }
  bool isDark = false;
  void changeMode(){
    isDark=!isDark;
    emit(ChangeModeState());
  }
  void  changeBottomNavBar( index){
    currentIndex=index;
     getSportsData();
    getScienceData();
    emit(ChangeBottomNavBarState());
  }
  void getBusinessData() {
    emit(NewsLoadingState());
    DioHelper.getData(
       'v2/top-headlines',
       {
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {

      print( 'valueeee ${value?.data['articles'][0]['title']}');
      business = value?.data['articles'];
      emit(GetBusinessSuccessState());
    }).catchError((error) {
      print("Error in getBusinessData: ${error.toString()}");
      emit(GetBusinessErrorState(error.toString()));
    });
  }
  void getSportsData() {
    emit(SportsLoadingState());
    DioHelper.getData(
      'v2/top-headlines',
      {
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {
      print( 'valueeee ${value?.data['articles'][0]['title']}');
      sports = value?.data['articles'];
      emit(GetSportsSuccessState());
    }).catchError((error) {
      print("Error in getBusinessData: ${error.toString()}");
      emit(GetSportsErrorState(error.toString()));
    });
  }
  void getScienceData() {
    emit(ScienceLoadingState());
    DioHelper.getData(
      'v2/top-headlines',
      {
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    )?.then((value) {

      print( 'valueeee ${value?.data['articles'][0]['title']}');
      science = value?.data['articles'];
      emit(GetScienceSuccessState());
    }).catchError((error) {
      print("Error in getBusinessData: ${error.toString()}");
      emit(GetScienceErrorState(error.toString()));
    });
  }


}

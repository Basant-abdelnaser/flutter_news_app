import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/mode_cubit/cubit.dart';
import 'package:news_app/mode_cubit/state.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import 'layout/home_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getDate('isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {

 bool ? isDark;
 MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) =>NewsCubit()..getBusinessData(),),
        BlocProvider(create: (BuildContext context) {
          return AppCubit()..changeMode(mode: isDark);
        })
      ],
       child :BlocConsumer<AppCubit,AppStates>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            key: ValueKey(AppCubit.get(context).isDark),
            themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            darkTheme: ThemeData(

                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    backgroundColor: HexColor('333739'),
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    titleTextStyle:TextStyle(
                        color: Colors.white
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor:  HexColor('333739'),
                    unselectedItemColor: Colors.white
                ),
                textTheme: TextTheme(
                    headlineSmall: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )
                ),
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelStyle: TextStyle(color: Colors.blueAccent), // label لما يكون focus
                prefixIconColor: Colors.blueAccent, // icon color لما يكون focus
              ),
            ),
            theme: ThemeData(

                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(
                        color: Colors.grey
                    ),
                    titleTextStyle:TextStyle(
                        color: Colors.blueAccent
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor:  Colors.white,
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    headlineSmall: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    )
                ),
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelStyle: TextStyle(color: Colors.blueAccent), // label لما يكون focus
                prefixIconColor: Colors.blueAccent,
                // icon color لما يكون focus
              ),
            ),
            home: Directionality(
                textDirection: TextDirection.ltr,
                child: HomeLayout()),
            debugShowCheckedModeBanner: false,
          );
        },
        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }
}



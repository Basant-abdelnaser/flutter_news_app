import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/mode_cubit/cubit.dart';

import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/settings.dart';
import 'package:news_app/modules/sports.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget>screens=[
      BusinessScreen(),
      ScienceScreen(),
      SportsScreen(),

    ];
    return  BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit,NewStates>(
        builder: (BuildContext context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News' ,style:  TextStyle(

                  fontWeight: FontWeight.bold,
                  fontSize: 35
              ),),
              actions: [
                IconButton(onPressed:() {
                }, icon: Icon(Icons.search,size: 37,),),
                IconButton(onPressed: (){
                  AppCubit.get(context).changeMode();
                }, icon: Icon(Icons.brightness_4_outlined,size: 37,))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.blueAccent,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                // backgroundColor: Colors.white,
                onTap: (index){
                  // print(index);
                  cubit.changeBottomNavBar(index);
                },
                currentIndex: cubit.currentIndex,
                items:
                [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.science_outlined),
                      label: 'Science'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_gymnastics),
                    label: 'Sports',

                  ),

                ]),
            body: screens[cubit.currentIndex],
          );
        },
        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }
}

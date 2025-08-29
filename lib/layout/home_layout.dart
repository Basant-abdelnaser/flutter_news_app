import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';


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
      create: (BuildContext context) =>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewStates>(
        builder: (BuildContext context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News' ,style:  TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 35
              ),),
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.blueAccent,
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
                  ), BottomNavigationBarItem(
                      icon: Icon(Icons.science_outlined),
                      label: 'Science'
                  ), BottomNavigationBarItem(
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

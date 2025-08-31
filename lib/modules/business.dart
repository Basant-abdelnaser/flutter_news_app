import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit,NewStates>(
      builder: (BuildContext context, state) { 
        return ConditionalBuilder(
          condition: state is ! NewsLoadingState,
          builder: (BuildContext context) {
            return  ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return buildArticleItem(cubit.business[index],context);
                }, separatorBuilder: (context,index)=>SizedBox(height: 20,), itemCount: 10);
          },
          fallback: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          },

        );
      },
      listener: (BuildContext context, Object? state) {  },
     
    );

  }
}

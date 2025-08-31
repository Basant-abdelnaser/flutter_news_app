import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    NewsCubit cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit,NewStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearchedData(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter text ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Search'),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white, // لون الخلفية العادي
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                ConditionalBuilder(
                  condition:cubit.searchList.length > 0,
                  builder: (BuildContext context) {
                    return  Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index){
                            return buildArticleItem(cubit.searchList[index],context);
                          }, separatorBuilder: (context,index)=>SizedBox(height: 20,), itemCount: 10),
                    );
                  },
                  fallback: (BuildContext context) {
                    return Center(child: CircularProgressIndicator());
                  },

                )
              ],
            )

          ),
        );
      },
      listener: (BuildContext context, Object? state) {  },

    );
  }
}

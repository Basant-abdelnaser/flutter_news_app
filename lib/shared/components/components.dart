import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget buildArticleItem (item,context){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      height: 120,
      child: Row(
        children:
        [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${item['urlToImage']}'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                   child: Text(
                     '${item['title']}',style:Theme.of(context).textTheme.headlineSmall,
                 // TextStyle(
                  //   fontSize: 22,
                  //   fontWeight: FontWeight.w500,
                  // ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${item['publishedAt']}' , style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700
                ),)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
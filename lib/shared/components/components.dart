import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget buildArticleItem (item,context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(url: item['url'])));
    },
    child: Padding(
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
                image: item['urlToImage'] != null && item['urlToImage'].toString().isNotEmpty
                    ? DecorationImage(
                  image: NetworkImage(item['urlToImage']),
                  fit: BoxFit.cover,
                )
                    : null, // 👈 لو مفيش صورة، بلاش DecorationImage
              ),
              child: item['urlToImage'] == null || item['urlToImage'].toString().isEmpty
                  ? Icon(Icons.image_not_supported, size: 40, color: Colors.grey) // 👈 fallback
                  : null,
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
    ),
  );
}
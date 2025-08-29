import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/home_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          // backgroundColor: Colors.black,
          // iconTheme: IconThemeData(color: Colors.white),
          // actionsIconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.blueAccent
          )
        ),
        scaffoldBackgroundColor: Colors.white,

      ),
      home: HomeLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}



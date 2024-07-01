import 'package:flutter/material.dart';
import 'package:news_app/layout/layout.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
             elevation: 0.1,
          )
      ),
      home: Layout_screen(),
    );
  }
}

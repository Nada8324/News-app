import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/CategoryController.dart';
import 'package:news_app/controller/saved_controller.dart';
import 'package:news_app/shared/components/Component.dart';
import '../model/categoryModel.dart';
import '../shared/styles/icon_broken.dart';
import '../view/category_screen.dart';
import '../view/home_screen.dart';
import '../view/saved_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:news_app/database/database.dart';

class LayoutController extends GetxController{
   int index=0;

  List<Widget> Screens=[Home_screen(),Category_screen(),Saved_screen()];
@override

  Widget buildbottom(){
    return  Align(
      alignment: Alignment.bottomCenter,

      child:  Container(
        padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
        child: ClipRRect(

          borderRadius: BorderRadius.all(
              Radius.circular(30.0)
          ),
          child:  BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              if(index<3) {
                index = value;
                update();
              }
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle:  TextStyle(color: Colors.grey),

            items: [
              BottomNavigationBarItem(icon: Icon(IconBroken.Home),
                  label:"News"),
              BottomNavigationBarItem(icon: Icon(IconBroken.Category),
                  label:"Categories"),
              BottomNavigationBarItem(icon: Icon(IconBroken.Bookmark),
                  label:"Save"),
            ],

          ),

        ),

      ),
    );
  }

}
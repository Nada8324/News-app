import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/database/database.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/shared/components/Component.dart';

import '../shared/styles/icon_broken.dart';

class Details_from_saved_Controller extends GetxController{
  var model=Get.arguments[0];
  var title=Get.arguments[1];
  var imageurl=Get.arguments[2];
  var des=Get.arguments[3];
  var date=Get.arguments[4];
  var author=Get.arguments[5];
  var content=Get.arguments[6];

  database_create d=Get.put(database_create());
  HomeController homeController=Get.put(HomeController());
  Widget details(Map<String,dynamic>model ){
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            alignment: AlignmentDirectional.topCenter,
            width: double.infinity,
            height: 400,
            child:Image(image: NetworkImage(imageurl??"dmnjdm"),
              fit: BoxFit.contain,
              loadingBuilder:(context, child, loadingProgress)  {
                if(loadingProgress==null){
                  return child;
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace)  {
                return Image(
                  image: NetworkImage('https://media.istockphoto.com/id/827247322/vector/danger-sign-vector-icon-attention-caution-illustration-business-concept-simple-flat-pictogram.jpg?s=612x612&w=0&k=20&c=BvyScQEVAM94DrdKVybDKc_s0FBxgYbu-Iv6u7yddbs='),
                  loadingBuilder:(context, child, loadingProgress)  {
                    if(loadingProgress==null){
                      return child;
                    }
                    else{
                      return Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }

                  },
                ) ;
              },),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            alignment: AlignmentGeometry.lerp(Alignment.bottomLeft, Alignment.topLeft, .68),
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
            ),
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(des??"description",style: TextStyle(

                color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18,)
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 150,
          bottom: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsetsDirectional.all(20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(date??"234",style: TextStyle(color: Colors.black54,fontSize: 13,),),
                  SizedBox(height: 10,),
                  Text(title??"title",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text(author??"author",style: TextStyle(color: Colors.black45,fontSize: 13,),),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
             child: CircleAvatar(
            child: Center(child: Icon(Iconsax.save_add1,color: Colors.white)),
              backgroundColor: Colors.black,
               radius: 25,

             )


          ),
        )
      ],
    );
  }
}
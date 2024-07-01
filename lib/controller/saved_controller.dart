
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/controller/CategoryController.dart';
import 'package:news_app/controller/details_from_saved_controller.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/database/database.dart';

import '../model/news_model.dart';
import '../shared/components/Component.dart';
import '../shared/styles/icon_broken.dart';
import '../view/Details_from_saved_screen.dart';
import '../view/details_screen.dart';

class Saved_controller extends GetxController{
  HomeController homeController=Get.find();
  database_create data=Get.put(database_create());
  CategoryController categoryController=Get.put(CategoryController());
  List<Map<String,dynamic>> news_list=[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data.get_from_database(data.database).then((value) {
      news_list=value;

      update();
    }
    );

  }
  Widget news(Map<String,dynamic> model) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(model['title']),
      onDismissed: (direction)  {
       data.delete_from_databse(model['title']);
       List<Map<String,dynamic>> news_list_deleted=[];
       news_list.forEach((element) {
         if(element['title']==model['title'])
           {

           }
         else{
           news_list_deleted.add(element);
         }
       });
       news_list=news_list_deleted;
       data.get_from_database(data.database).then((value) {
         news_list=value;
         update();
       }
       );
       print("delete from list");
       print(news_list);
       homeController.list_of_news?.forEach((element) {
         if(element.title==model['title']){
           element.saved=false;
         }
       });
       categoryController.newsModel?.List_of_articles?.forEach((element) {
         if(element.title==model['title']){
           element.saved=false;
         }
       });
       update();

      },
      background: Container(
       width: double.infinity,
        color: Colors.grey[200],
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Icon(IconBroken.Delete),
  ),
),
      child: InkWell(
        onTap: () {
          Get.to(()=>Details_from_saved_screen(),arguments: [model,model['title'],model['urlToImage'],model['description'],model['publishedAt'],model['author'],model['contant']]);
        },
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Image(image: NetworkImage(model['urlToImage']??"https://picsum.photos/250?image=9"),
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
                },
                  fit: BoxFit.cover,
                loadingBuilder:(context, child, loadingProgress)  {
                  if(loadingProgress==null){
                    return child;
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    );
                  }
                },),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        model['title']??"title",
                        style: TextStyle(color: Colors.grey, fontSize: 15),maxLines: 1),
                    Text(model['description']??"description", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                        maxLines: 3),
                  ],

                ),
              ),
            ),
            SizedBox(width: 30),
            Icon(Iconsax.save_add1),
              // Icon(IconBroken.Bookmark)

          ],

        ),
      ),
    );
  }
}
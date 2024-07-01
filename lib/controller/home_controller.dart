import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/controller/saved_controller.dart';
import 'package:news_app/database/database.dart';
import 'package:news_app/shared/components/Component.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../model/news_model.dart';
import '../shared/styles/icon_broken.dart';
import '../view/details_screen.dart';
class HomeController extends GetxController {
  NewsModel ? newsModel;
  List<News_details>? list_of_news = [];
   List<Map<String,dynamic>>saved_news_list=[];
  database_create d=Get.put(database_create());
  @override
  void onInit() async {
    super.onInit();
    await DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'us',
          'apiKey': 'dbba2e1d2871400ebceb43654784466c',
        }
    ).then((value)  {
      newsModel = NewsModel.fromJson(value?.data);
      list_of_news = newsModel?.List_of_articles;
      d.get_from_database(d.database).then((value) =>
      saved_news_list = value
      ).then((value) {
        list_of_news?.forEach((element) {
          saved_news_list?.forEach((element_saved) {
            if (element_saved['url'] == element.url) {
              element.saved = true;
            }
          });
        });
      }
      ).then((value) => update());
    });
  }
  Widget news(News_details model) {
    return InkWell(
      onTap: () async{
       await Get.to(()=>Details_screen(),arguments: [model,model.title,model.urlToImage,model.description,model.publishedAt,model.author,model.content],transition:Transition.leftToRightWithFade );
       update();
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
            child: Image(image: NetworkImage(
                model.urlToImage??"jhgchj",
                ),
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
                },

                fit: BoxFit.cover),
          ),
          SizedBox(width: 25),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      model.title??"title",
                      style: TextStyle(color: Colors.grey, fontSize: 15),maxLines: 1),
                  Text(model.description??"description", style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ), maxLines: 3),
                ],
              ),
            ),
          ),
          SizedBox(width: 30),
          IconButton(onPressed: () {
           model.saved=!model.saved;
           if(model.saved){
             d.insert_to_database(model);
           }
           else{
             d.delete_from_databse(model.title??"null");
           }
          update();
            //save_add1 added
          }, icon: model.saved?Icon(Iconsax.save_add1):Icon(IconBroken.Bookmark),
            // Icon(IconBroken.Bookmark)
          ),
        ],

      ),
    );
  }
}
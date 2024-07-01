import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/saved_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/components/Component.dart';

class database_create extends GetxController{

   late Database database;
  @override
   void onInit() {
    // TODO: implement onInit
    super.onInit();
    create_database();
  }
   void create_database()  {
     openDatabase(
      'news.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE newss (title TEXT NOT NULL PRIMARY KEY, description TEXT NOT NULL, author TEXT NOT NULL, url TEXT NOT NULL, urlToImage TEXT NOT NULL, publishedAt TEXT NOT NULL, content DATE NOT NULL)'
            'CREATE TABLE Unit '
        ).then((value) {
          print("table created");
          update();
        });
      },
      onOpen: (database) {
         get_from_database(database).then((value) {
          news_list=value;
          print("data base get");
          update();
        });
      },
    ).then((value) {
       database = value;
       update();
     });

  }
    insert_to_database(News_details model) async {
       await database.transaction((txn) async{
     await txn
          .rawInsert(
          'INSERT INTO newss(title, description, author, url, urlToImage, publishedAt, content) VALUES("${model.title}", "${model.description}", "${model.author}", "${model.url}", "${model.urlToImage}", "${model.publishedAt}", "${model.content}")'
      ).then((value) {
         get_from_database(database).then((value) {
          news_list=value;
          print("data base get");
          update();
        });
         return null;
      });
    });
  }
    Future<List<Map<String,dynamic>>> get_from_database(database) async {
    return await database.rawQuery('SELECT * FROM newss');
  }
   void delete_from_databse(String title) async {
    await database
        .rawDelete('DELETE FROM newss WHERE title = ?', ['$title'])
         .then((value) {
           get_from_database(database).then((value) {
         news_list=value;
         print("data base get");
         update();
         });
         print('deleted');
         update();
         });

  }
}
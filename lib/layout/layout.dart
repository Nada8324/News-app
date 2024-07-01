import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/CategoryController.dart';
import 'package:news_app/layout/layoutcontroller.dart';
import 'package:news_app/shared/components/Component.dart';
import 'package:news_app/view/category_screen.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/saved_screen.dart';
import '../shared/styles/icon_broken.dart';

class Layout_screen extends StatelessWidget {
  CategoryController categoryControllerr=Get.put(CategoryController());
 CategoryController categoryController=Get.find();
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LayoutController>(

      init: LayoutController(),
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(

              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "News",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),

                  ),
                  Text(
                    "App",style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),

                  ),
                ],
              ),
            ),
            body:Stack(

              children: [
                // categoryController.press?Each_category_screen(categoryController.categoryModel?.name):
                controller.Screens[controller.index],
                controller.buildbottom(),
              ],
            )

        );
      },
    );
  }
}

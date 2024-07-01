import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/CategoryController.dart';

import '../shared/components/Component.dart';

class Category_screen extends StatelessWidget {
  Category_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),

      builder: (controllerr) {
        return PageView(

          allowImplicitScrolling: false,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Categories",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                  decoration: BoxDecoration(color: Colors.white,boxShadow: [ BoxShadow(
                    color: Colors.white,
                    blurRadius: 200,
                    blurStyle: BlurStyle.outer,
                  ),
                  ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ) ,
                Expanded(
                  child: GridView.builder(
                    itemBuilder: (context, index) =>controllerr.buildCategoryItem(controllerr.categories[index]),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: 7,
                  ),
                ),
              ],
            )
        ),
            controllerr.build_second_screen(controllerr.newsModel?.List_of_articles??[]),
          ],
          scrollDirection: Axis.horizontal,
          controller: controllerr.controller,
          onPageChanged: (num) {
            controllerr.change_Index(num);
          },
        ) ;
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/shared/components/Component.dart';
import 'package:news_app/view/category_screen.dart';
import 'package:news_app/view/details_screen.dart';



import '../shared/styles/icon_broken.dart';

class Home_screen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
       init: HomeController(),
       autoRemove: false,
       builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Latest News",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      ),
                      Spacer(),
                      Icon(IconBroken.Arrow___Right_Circle,color: Colors.grey,)
                    ],
                  ),
                  Container(
                    height: 620,
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            return controller.news(controller.list_of_news![index]);
                          },
                          itemCount: controller.list_of_news!.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,)
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}


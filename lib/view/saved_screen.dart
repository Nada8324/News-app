import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/components/Component.dart';

import '../controller/saved_controller.dart';
import 'details_screen.dart';

class Saved_screen extends StatelessWidget {
  const Saved_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  GetBuilder<Saved_controller>(
      init: Saved_controller(),
      builder: (controller) {
        return  Container(
          height: 620,
          width: double.infinity,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                    return controller.news(controller.news_list[index]);
                    },
                itemCount: controller.news_list.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,)
          ),
        );
      },
    ),
    );
  }
}

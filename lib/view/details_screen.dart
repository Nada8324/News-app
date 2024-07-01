import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/detailse_controller.dart';
class Details_screen extends StatelessWidget {
  const Details_screen ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Details_Controller>(
      init: Details_Controller(),
      builder:(controller) =>  Scaffold(
        backgroundColor: Colors.black,
          body:controller.details(controller.model)
      )
    );
  }
}

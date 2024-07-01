import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/details_from_saved_controller.dart';
import 'package:news_app/controller/detailse_controller.dart';
class Details_from_saved_screen extends StatelessWidget {
  const Details_from_saved_screen ({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Details_from_saved_Controller>(
        init: Details_from_saved_Controller(),
        builder:(controller) =>  Scaffold(
            backgroundColor: Colors.black,
            body:controller.details(controller.model)
        )
    );
  }
}

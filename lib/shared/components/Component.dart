import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/shared/styles/icon_broken.dart';

import '../../view/details_screen.dart';
  List<Map<String,dynamic>> news_list=[];
  String? category_name;
  bool detail=false;
  int index=0;

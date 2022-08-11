import 'package:clock_app/model/menu_info.dart';
import 'package:clock_app/screens/homepage.dart';
import 'package:clock_app/screens/enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:ChangeNotifierProvider<MenuInfo>(create: (context)=> MenuInfo(MenuType.clock, title: "Clock", imageSource: "imageSource"),
    child: HomePage(),

  ),
   )
    );
}

  


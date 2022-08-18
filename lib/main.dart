import 'package:clock_app/model/menu_info.dart';
import 'package:clock_app/screens/homepage.dart';
import 'package:clock_app/screens/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var androidInitialize = const AndroidInitializationSettings('ic_launcher');
  var initializationSettings =
      InitializationSettings(android: androidInitialize);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider<MenuInfo>(
      create: (context) =>
          MenuInfo(MenuType.clock, title: "Clock", imageSource: "imageSource"),
      child: HomePage(),
    ),
  ));
}

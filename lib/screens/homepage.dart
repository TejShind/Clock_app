import 'dart:developer';

import 'package:clock_app/data.dart';
import 'package:clock_app/model/menu_info.dart';
import 'package:clock_app/view/alaram_page.dart';
import 'package:clock_app/view/clock_page.dart';
import 'package:clock_app/view/clock_view.dart';
import 'package:clock_app/screens/enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(color: Colors.white54, width: 1),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return const AlaramPage();
                } else {
                  return Container(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          const TextSpan(text: "**************"),
                          TextSpan(
                            text: value.title,
                            style: TextStyle(fontSize: 48),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
          color: currentMenuInfo.menuType == value.menuType ? Color(0xFF2D2F41) : Color.fromARGB(15, 243, 84, 124) ,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title,
      
                style: TextStyle(fontFamily: 'avenir',color:Color.fromARGB(255, 218, 185, 88), fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}

  // Widget buildMenuButton(MenuInfo currentMenuInfo) {
  //   return Consumer<MenuInfo>(
  //     builder: (BuildContext context, value, Widget? child) {
  //       return FlatButton(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.only(topRight: Radius.circular(32))),
  //           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
  //           color: currentMenuInfo.menuType == value.menuType
  //               ? Colors.green
  //               : Colors.transparent,
  //           onPressed: () {
  //             var menuInfo = Provider.of<MenuInfo>(context, listen: false);
  //             menuInfo.updateMenu(currentMenuInfo);
  //           },
  //           child: Column(
  //             children: [
  //               Image.asset(
  //                 currentMenuInfo.imageSource,
  //                 scale: 2.5,
  //               ),
  //               const SizedBox(height: 10),
  //               Text(
  //                 currentMenuInfo.title,
  //                 style: const TextStyle(
  //                     fontFamily: "avenir", color: Colors.white, fontSize: 14),
  //               )
  //             ],
  //           ));
  //     },
  //   );
  // }


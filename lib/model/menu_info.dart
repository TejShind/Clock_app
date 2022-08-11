import 'package:clock_app/screens/enum.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends ChangeNotifier {
  late MenuType menuType;
  late String title;
  late String imageSource;

  MenuInfo(this.menuType, {required this.title, required this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;
//Whenever you update your model you have to triggers this model to notify all the consumers listening to it
    notifyListeners();
  }
}

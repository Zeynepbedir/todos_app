import 'package:flutter/material.dart';
import 'package:todos_app_odev/ui/tools/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  MyAppBar({required this.title}); //this: bu sınıfı işaret eder - self(ios)
  //super: kalıtım, bir üst sınıfı işaret eder

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: textColor2, fontSize: 24, fontFamily: "Oswald"),
      ),
      centerTitle: true,
      backgroundColor: mainColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

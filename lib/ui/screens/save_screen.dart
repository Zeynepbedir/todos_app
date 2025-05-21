import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/ui/component/my_app_bar.dart';
import 'package:todos_app_odev/ui/cubits/save_cubit.dart';
import 'package:todos_app_odev/ui/tools/app_colors.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  var list = [
    "agac.png",
    "araba.png",
    "cicek.png",
    "damla.png",
    "gezegen.png",
    "gunes.png",
    "roket.png",
    "semsiye.png",
    "simsek.png",
    "yildiz.png"
  ];
  var image = "agac.png";

  var tfName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = list[Random().nextInt(list.length)];
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Scaffold(
      appBar: MyAppBar(title: "Save Screen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/$image"),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                controller: tfName,
                decoration: const InputDecoration(hintText: "Name"),
              ),
            ),
            SizedBox(
              width: screenWidth / 2,
              height: screenHeight / 15,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SaveCubit>().save(tfName.text, image);
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: Text(
                  "SAVE",
                  style: TextStyle(color: textColor2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

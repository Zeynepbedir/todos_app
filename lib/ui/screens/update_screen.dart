import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/data/entity/todos.dart';
import 'package:todos_app_odev/ui/component/my_app_bar.dart';
import 'package:todos_app_odev/ui/cubits/update_cubit.dart';
import 'package:todos_app_odev/ui/tools/app_colors.dart';
import 'package:todos_app_odev/data/entity/todos.dart';

class UpdateScreen extends StatefulWidget {
  Todos toDos;
  UpdateScreen({required this.toDos});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var tfName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tfName.text = widget.toDos.name;
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Scaffold(
      appBar: MyAppBar(title: "Update Screen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.toDos.image}"),
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
                  context
                      .read<UpdateCubit>()
                      .update(widget.toDos.id, tfName.text);
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: Text(
                  "UPDATE",
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

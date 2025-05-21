import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/data/entity/todos.dart';
import 'package:todos_app_odev/ui/component/my_app_bar.dart';
import 'package:todos_app_odev/ui/cubits/main_cubit.dart';
import 'package:todos_app_odev/ui/screens/save_screen.dart';
import 'package:todos_app_odev/ui/screens/update_screen.dart';
import 'package:todos_app_odev/ui/tools/app_colors.dart';

//const: sabit, özellikle görsel kullanılır
//final : sabit, özellikle değişkenler için sayılar, yazılar vb.

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().loadTodos();
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "ToDos"),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                placeholder: "Search",
                onChanged: (searchText) {
                  context.read<MainCubit>().search(searchText);
                },
              ),
            ),
            BlocBuilder<MainCubit, List<Todos>>(
              builder: (context, toDosList) {
                if (toDosList.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: toDosList.length,
                      itemBuilder: (context, index) {
                        var toDo = toDosList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateScreen(toDos: toDo))).then((_) {
                              context.read<MainCubit>().loadTodos();
                            });
                          },
                          child: Card(
                              child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("images/${toDo.image}"),
                              ),
                              Text(
                                toDo.name,
                                style: TextStyle(
                                    fontSize: 20, fontFamily: "Oswald"),
                              ),
                              const Spacer(), //kalan boşlukları doldurmak için kullanılır.
                              IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: mainColor,
                                        content: Text(
                                          "Do you want to delete ${toDo.name} ?",
                                          style: TextStyle(color: textColor2),
                                        ),
                                        action: SnackBarAction(
                                            textColor: textColor2,
                                            label: "Yes",
                                            onPressed: () {
                                              context
                                                  .read<MainCubit>()
                                                  .delete(toDo.id);
                                            }),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: textColor1,
                                  ))
                            ],
                          )),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center();
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFD9CDBF),
        onPressed: () {
          //contex; bulunduğumuz sayfayı temsil ediyor
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SaveScreen())).then((_) {
            context
                .read<MainCubit>()
                .loadTodos(); //sayfaya geri dönüldüğünde sayfanın güncellenmesi için loadtodos fonksiyonu ile yaptık.
          });
        },
        label: const Text("New To-Do"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

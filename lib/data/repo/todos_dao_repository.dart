import 'package:todos_app_odev/data/entity/todos.dart';
import 'package:todos_app_odev/data/sqlite/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class ToDosDaoRepository {
  //Dao : Database Access Object
  Future<void> save(String name, String image) async {
    var db = await DatabaseHelper.veritabaniErisim();
    var newToDo = Map<String, dynamic>();
    newToDo["name"] = name;
    newToDo["image"] = image;

    await db.insert("toDos", newToDo);
  }

  Future<void> update(int id, String name) async {
    var db = await DatabaseHelper.veritabaniErisim();
    var updatedToDo = Map<String, dynamic>();
    updatedToDo["name"] = name;

    await db.update("toDos", updatedToDo, where: "id=?", whereArgs: [id]);
  }

  Future<List<Todos>> loadTodos() async {
    var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> list = await db.rawQuery("SELECT * FROM toDos");
    return List.generate(list.length, (index) {
      var row = list[index];
      var id = row["id"];
      var name = row["name"];
      var image = row["image"];
      return Todos(id: id, name: name, image: image);
    });
  }

  Future<List<Todos>> search(String searchText) async {
    var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> list = await db
        .rawQuery("SELECT * FROM toDos WHERE name LIKE '%$searchText%' ");
    return List.generate(list.length, (index) {
      var row = list[index];
      var id = row["id"];
      var name = row["name"];
      var image = row["image"];
      return Todos(id: id, name: name, image: image);
    });
  }

  Future<void> delete(int id) async {
    var db = await DatabaseHelper.veritabaniErisim();
    await db.delete("toDos", where: "id=?", whereArgs: [id]);
  }
}

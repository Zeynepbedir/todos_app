import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/data/entity/todos.dart';
import 'package:todos_app_odev/data/repo/todos_dao_repository.dart';

class MainCubit extends Cubit<List<Todos>> {
  MainCubit() : super(<Todos>[]);
  //<Todos>[] eğer boş ise görünümü boş yapmak için liste verisi gönderimi yapması içinkullanıldı.
  var toDosDaoRepository = ToDosDaoRepository();

  Future<void> loadTodos() async {
    var list = await toDosDaoRepository.loadTodos();
    emit(list);
  }

  Future<void> search(String searchText) async {
    var list = await toDosDaoRepository.search(searchText);
    emit(list);
  }

  Future<void> delete(int id) async {
    await toDosDaoRepository.delete(id);
    await loadTodos(); //silme işlemi yapıldıktan sonra ara yüze göstermek için
  }
}

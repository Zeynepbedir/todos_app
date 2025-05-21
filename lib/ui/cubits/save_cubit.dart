import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/data/repo/todos_dao_repository.dart';

class SaveCubit extends Cubit<void> {
  SaveCubit() : super(0);
  var toDosDaoRepository = ToDosDaoRepository();

  Future<void> save(String name, String image) async {
    await toDosDaoRepository.save(name, image);
  }
}

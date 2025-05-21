import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app_odev/data/repo/todos_dao_repository.dart';

class UpdateCubit extends Cubit<void> {
  UpdateCubit() : super(0);
  var toDosDaoRepository = ToDosDaoRepository();

  Future<void> update(int id, String name) async {
    await toDosDaoRepository.update(
        id, name); //işlemin yarım kalmadan bitirilmesini await sağlar.
  }
}

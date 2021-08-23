import 'package:cadastro_de_alunos/models/student.dart';
import 'package:cadastro_de_alunos/models/db_local.dart';
import 'package:cadastro_de_alunos/repository/student/student_repository.dart';
import 'package:sqflite/sqflite.dart';

class StudentDbRepository implements StudentRepository {
  @override
  late DBlocal dBlocal;

  StudentDbRepository() {
    dBlocal = DBlocal(
      table: 'students',
      dbname: '',
    );
  }

  @override
  Future<Student> find(int id) async {
    Database database = await dBlocal.getConnection();
    var data =
        await database.query(dBlocal.table, where: "id=", whereArgs: [id]);
    database.close();
    return Student.fromMap(data.first);
  }

  @override
  Future<List<Student>> findAll() async {
    Database database = await dBlocal.getConnection();
    var data = await database.query(dBlocal.table);
    database.close();
    return data.map((map) => Student.fromMap(map)).toList();
  }

  @override
  Future<int> insert(Student entity) async {
    Database database = await dBlocal.getConnection();
    int result = await database.insert(dBlocal.table, entity.toMap());
    database.close();
    return result;
  }

  @override
  Future<int> remove(
      {required String conditions, required List conditionsValues}) async {
    Database database = await dBlocal.getConnection();
    int result = await database.delete(
      dBlocal.table,
      where: conditions,
      whereArgs: conditionsValues,
    );
    database.close();
    return result;
  }

  @override
  Future<int> update(
      {required Student enitity,
      required String conditions,
      required List conditionsValues}) async {
    Database database = await dBlocal.getConnection();
    int result = await database.update(
      dBlocal.table,
      enitity.toMap(),
      where: conditions,
      whereArgs: conditionsValues,
    );
    database.close();
    return result;
  }
}

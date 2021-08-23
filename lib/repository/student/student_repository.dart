import 'package:cadastro_de_alunos/models/db_local.dart';
import 'package:cadastro_de_alunos/models/repository.dart';
import 'package:cadastro_de_alunos/models/student.dart';

abstract class StudentRepository implements IRepositoryh<Student> {
  //Fontes de dados
  late DBlocal dBlocal;
  
}

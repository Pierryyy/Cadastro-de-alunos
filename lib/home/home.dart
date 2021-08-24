import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _registerController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de alunos'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Matricula do Aluno',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              controller: _registerController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome do Aluno',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
              controller: _nameController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email do Aluno',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: register,
              child: Text('Cadastrar aluno'),
            )
          ],
        ),
      ),
    );
  }

  void register() async {
    String name = _nameController.text;
    String email = _emailController.text;

    if (!EmailValidator.validate(email)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Mensagem do Sistema'),
          content: Text('Email inválido!!!'),
        ),
      );
    } else {}
  }
}

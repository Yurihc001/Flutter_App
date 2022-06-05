import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/mensagem.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({Key? key}) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Guia Gamer'),
          centerTitle: true,
          backgroundColor: Colors.indigo),
      backgroundColor: Colors.indigo[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome', txtNome, Icons.people),
            const SizedBox(height: 20),
            campoTexto('Email', txtEmail, Icons.email),
            const SizedBox(height: 20),
            campoTexto('Senha', txtSenha, Icons.lock, senha: true),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(200, 45),
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text('criar'),
                    onPressed: () {
                      criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(200, 45),
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text('cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.indigo,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, color: Colors.indigo),
        prefixIconColor: Colors.indigo,
        labelText: texto,
        labelStyle: const TextStyle(color: Colors.indigo),
        border: const OutlineInputBorder(),
        focusColor: Colors.indigo,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 0.0,
          ),
        ),
      ),
    );
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha) {
    
    FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: email, password: senha)
    .then((res){

      //ARMAZENAR O NOME NA COLEÇÃO DE USUÁRIOS
      FirebaseFirestore.instance
        .collection('usuarios')
        .add(
          {
            "uid" : res.user!.uid.toString(),
            "nome" : nome,
          }
        );

      //TUDO CERTO!!
      sucesso(context,'Usuário criado com sucesso!');
      Navigator.pop(context);
    }).catchError((e){
      switch(e.code){
        case 'invalid-email':
          erro(context,'O formato do email é inválido.');
          break;
        case 'email-already-in-use':
         erro(context,'O email já foi cadastrado.');
          break;
        default:
          erro(context,e.code.toString());
      }
    });

  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/View/Tela_Detalhes.dart';

import 'widgets/mensagem.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> { 
  //Declaração de atributos que serão utilizados
  //para receber os dados que o usuário digitar
  //no campo de texto
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;

  //Declaração do atributo que identifica
  //unicamente o formulário
  var f1 = GlobalKey<FormState>();

  @override
  void initState() {
    //definir o valor inicial da variável
    //txtPeso.text = '123456';
    super.initState();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia Gamer'),
        centerTitle: true,
        backgroundColor: Colors.indigo
      ),
      backgroundColor: Colors.indigo[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Email', txtEmail, Icons.email),
            const SizedBox(height: 20),
            campoTexto('Senha', txtSenha, Icons.lock, senha: true),
            const SizedBox(height: 40),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size(200, 45),
                backgroundColor: Colors.indigo
              ),
              child: const Text('entrar'),
              onPressed: () {
                login(txtEmail.text, txtSenha.text);
                Navigator.pushNamed(context, 't3');
              },
            ),
            const SizedBox(height: 50),
            TextButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: const Text('Criar conta'),
              onPressed: () {
                Navigator.pushNamed(context, 't2');
              },
            ),
          ],
        ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
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
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {
    
    FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: senha)
    .then((res){
      //TUDO CERTO
      sucesso(context,'Usuário autenticado com sucesso.');
      Navigator.pushReplacementNamed(context, 'principal');
    }).catchError((e){
      switch(e.code){
        case 'invalid-email':
          erro(context,'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context,'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context,'Senha incorreta.');
          break;
        default:
          erro(context,e.code.toString());
      }
    });

  }
}
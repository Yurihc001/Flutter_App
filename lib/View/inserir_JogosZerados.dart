import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'widgets/mensagem.dart';

class inserir_JogosZerados extends StatefulWidget {
  const inserir_JogosZerados({Key? key}) : super(key: key);

  @override
  State<inserir_JogosZerados> createState() => _inserir_JogosZeradosState();
}

class _inserir_JogosZeradosState extends State<inserir_JogosZerados> {

  var txtNome = TextEditingController();
  var txtdata = TextEditingController();

  retornarDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('zerados')
        .doc(id)
        .get()
        .then((doc) {
      txtNome.text = doc.get('nome');
      txtdata.text = doc.get('data');
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID do zerados
    var id = ModalRoute.of(context)!.settings.arguments;

    if (id != null) {
      if (txtNome.text.isEmpty && txtdata.text.isEmpty) {
        retornarDocumentoById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia Gamer'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Nome', txtNome, Icons.gamepad_outlined),
            const SizedBox(height: 20),
            campoTexto('data', txtdata, Icons.calendar_today),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.indigo.shade900,
                    ),
                    child: Text( (id==null) ? 'salvar' : 'alterar'),
                    onPressed: () {
                      if (id == null) {
                        //Adicionar um novo documento
                        FirebaseFirestore.instance.collection('zerados').add(
                          {
                            "nome": txtNome.text,
                            "data": txtdata.text,
                          },
                        );
                        sucesso(context, 'O item foi adicionado com sucesso.');
                      } else {
                        //Alterar um documento
                        FirebaseFirestore.instance
                            .collection('zerados')
                            .doc(id.toString())
                            .set(
                          {
                            "nome": txtNome.text,
                            "data": txtdata.text,
                          },
                        );
                        sucesso(context, 'O item foi alterado com sucesso.');
                      }

                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.indigo.shade900,
                      ),
                      child: const Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
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

}
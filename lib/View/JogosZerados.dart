import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/mensagem.dart';

class JogosZerados extends StatefulWidget {
  const JogosZerados({Key? key}) : super(key: key);

  @override
  State<JogosZerados> createState() => _JogosZeradosState();
}

class _JogosZeradosState extends State<JogosZerados> {

  //Referenciar Coleção
  var zerados;

  @override
  void initState() {
    super.initState();
    zerados = FirebaseFirestore.instance.collection('zerados');
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia Gamer'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        actions: [
          Column(
            children: [
              IconButton(
                tooltip: 'sair',
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 't2');
                },
                icon: const Icon(Icons.logout),
              ),
              Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: Colors.indigo[50],
      body: Container(
        padding: const EdgeInsets.all(50),

        //
        // EXIBIR os documentos da coleção
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: zerados.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 't10');
        },
      ),
    );
  }

  exibirDocumento(item) {
    String nome = item.data()['nome'];
    String data = item.data()['data'];

    return ListTile(
      title: Text(nome),
      subtitle: Text(data),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () {
          zerados.doc(item.id).delete();
          sucesso(context, 'O documento foi apagado com sucesso.');
        },
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          't10',
          arguments: item.id,
        );
      },
    );
  }  

}
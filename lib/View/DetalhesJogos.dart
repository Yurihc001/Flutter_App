import 'package:flutter/material.dart';
import '../model/favoritos.dart';

class DetalhesJogos extends StatefulWidget {
  const DetalhesJogos({Key? key}) : super(key: key);

  @override
  State<DetalhesJogos> createState() => _DetalhesJogosState();
}

class _DetalhesJogosState extends State<DetalhesJogos> {
  @override
  Widget build(BuildContext context) {
    final Favoritos u = ModalRoute.of(context)!.settings.arguments as Favoritos;

    return Scaffold(
      appBar: AppBar(
        title: Text(u.titulo),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(u.descricao, style: const TextStyle(fontSize: 12)),
            Text(u.ano, style: const TextStyle(fontSize: 15)),
            Text(u.id, style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite_outlined),
        backgroundColor: Colors.red,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'O jogo ${u.titulo.toUpperCase()} foi adicionado aos favoritos.',
              ),
              duration: const Duration(seconds: 2),
            ),
          );

          Navigator.pushReplacementNamed(context, 't6');
        },
      ),
    );
  }
}

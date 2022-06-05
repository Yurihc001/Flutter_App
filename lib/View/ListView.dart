//Responsável pela biblioteca que convert json
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/favoritos.dart';

import 'package:flutter/services.dart';

class telaFavoritos extends StatefulWidget {
  const telaFavoritos({Key? key}) : super(key: key);

  @override
  State<telaFavoritos> createState() => _telaFavoritosState();
}

class _telaFavoritosState extends State<telaFavoritos> {
  List<Favoritos> lista = [];

  carregarJson() async {
    final String arquivo = await rootBundle.loadString('lib/data/Favoritos.json');
    final dynamic data = await json.decode(arquivo);

    setState(() {
      data.forEach((item) {
        lista.add(Favoritos.fromJson(item));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Guia Gamer'), backgroundColor: Colors.blue),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  lista[index].titulo,
                  style: const TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  lista[index].ano,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: const Icon(Icons.keyboard_double_arrow_right_rounded),
                onTap: () {
                  Navigator.pushNamed(context, 't8', arguments: lista[index]);
                },
              );
            }),
      ),
    );
  }
}

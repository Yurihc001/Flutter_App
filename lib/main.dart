import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/View/JogosZerados.dart';
import 'package:flutter_app/View/ListView.dart';
import 'package:flutter_app/View/inserir_JogosZerados.dart';
import 'package:flutter_app/View/sobre_app.dart';
import 'package:flutter_app/View/telademenu.dart';
import 'package:flutter_app/View/teladiscord.dart';
import 'package:flutter_app/View/telaFavoritos.dart';
import 'package:flutter_app/View/detalhesJogos.dart';

import 'firebase_options.dart';
import 'view/tela_detalhes.dart';
import 'view/tela_principal.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Guia Gamer',
    initialRoute: 't1',
    routes: {
      't1': (context) => const TelaPrincipal(),
      't2': (context) => const TelaDetalhes(),
      't3': (context) => const telaDeMenu(),
      't4': (context) => const telasobre(),
      't5': (context) => const teladiscord(),
      't6': (context) => const favoritosListagem(),
      't7': (context) => const telaFavoritos(),
      't8': (context) => const DetalhesJogos(),
      't9': (context) => const JogosZerados(),
      't10':(context) => const inserir_JogosZerados(),
    },
  ));
}

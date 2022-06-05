import 'package:flutter/material.dart';

class telasobre extends StatelessWidget {
  const telasobre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       appBar: AppBar(title: Text('Exibindo imagem local')), 
       body: Column(
         children: <Widget> [
          Image.asset('imagens/yuri.jpeg', scale: 4.8,
          ),
          const Text('Criador: Yuri'), 
          const SizedBox(
         
          height: 10.0,
          
          ),


          const Text(
            "Tema: video game", style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
          ),
          Text('Objetivo: Desenvolver um aplicativo para dispositivos móveis a fim de guiar os jogadores nos jogos.'),   


       ],
       ),
       ),      
    );
  }
}
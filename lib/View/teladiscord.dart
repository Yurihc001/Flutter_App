import 'package:flutter/material.dart';

class teladiscord extends StatelessWidget {
  const teladiscord({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text('Informações sobre')),
        body: Column(
        
          children: <Widget> [
             Image.asset('imagem_discord/discord.png', scale: 1.8,
             ),
             const Text('O que é o Discord'),
             const Text('Discord é um aplicativo de voz sobre IP proprietário e gratuito, projetado inicialmente para comunidades de jogos.'),
             const Text('O aplicativo Discord está disponível para os sistemas operacionais Microsoft Windows, MacOS, Android, iOS, Linux e em navegadores da Web.'),

            TextButton(
              onPressed: () =>  showDialog <String> (
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Alerta'),
                  content: const Text('Alerta o link não esta funcionando'),
                  actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],

                )
              ),
              child: const Text('Link do Discord'),
              )

          ],
          
        ),

        

      )
    );
  }
}
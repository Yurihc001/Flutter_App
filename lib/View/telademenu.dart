import 'dart:html';

import 'package:flutter/material.dart';

class telaDeMenu extends StatefulWidget {
  const telaDeMenu({Key? key}) : super(key: key);

  @override
  State<telaDeMenu> createState() => telaDeMenuState();
}

class telaDeMenuState extends State<telaDeMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Container(
          color: Colors.indigo[50],
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          'https://img.elo7.com.br/product/zoom/3041510/big-poster-serie-stranger-things-netflix-lo001-90x60-cm-geek.jpg'),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Yuri"),
                accountEmail: Text("cazarotti123@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.indigo
                          : Colors.white,
                  child: Text(
                    "Y",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("meus favoritos..."),
                onTap: () {
                  debugPrint('toquei no drawer');
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Perfil"),
                subtitle: Text("Perfil do usúario..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outlined),
                title: Text("Sobre"),
                subtitle: Text("Inforações sobre o App..."),
                onTap: () {
                  Navigator.pushNamed(context, 't4');
                },
              ),
              ListTile(
                leading: Icon(Icons.discord_rounded),
                title: Text("Discord"),
                subtitle: Text("Entre em nossa counidade..."),
                onTap: () {
                  Navigator.pushNamed(context, 't5');
                },
              ),
              ListTile(
                leading: Icon(Icons.discord_rounded),
                title: Text("Jogos Zerados"),
                subtitle: Text("Entre para saber seus jogos zerados..."),
                onTap: () {
                  Navigator.pushNamed(context, 't9');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

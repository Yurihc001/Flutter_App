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
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Container(
          color: Colors.indigo[50],
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                child: const Text("Mais acessados"),
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
                          "https://i.imgur.com/NuLQZnh.jpg"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/9/98/Destiny_2_capa.jpg"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/2/22/Dark_Souls_2_capa.png"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/7/7e/God_of_War_2_capa.png"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/8/82/God_of_War_2018_capa.png"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvqyrla3OmbDmoWVbCknTaviK6mR2iEwJQNg&usqp=CAU"),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: const Text("Recomendados"),
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
                          "https://upload.wikimedia.org/wikipedia/pt/a/a5/God_of_War_Ragnar%C3%B6k_capa.jpg"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://cdn.ome.lt/legacy/images/galerias/GTAV/GTA-V-Capa-Brasil-Xbox360.jpg"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnz_RZ6pS1vH-T7tFsC83ME6RxdbXTNZ1eJQ&usqp=CAU"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/pt/a/ac/Hot_Wheels_Unleashed_capa.jpg"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://s2.glbimg.com/3O5QIrqW9x0RSNSZQFht2LHjbu0=/0x0:405x504/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2019/L/I/BMzmPSRdSmMPlBm1B3kA/image006.jpg"),
                      color: Colors.black,
                    ),
                    Container(
                      width: 170,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                          "https://1.bp.blogspot.com/-LshHJf-Wfgg/U5ep1J9M07I/AAAAAAAAJv4/cxx1OnnQKMw/s1600/hyrule.jpg"),
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

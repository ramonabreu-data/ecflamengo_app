import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

 
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final Uri youtube =
      Uri(scheme: 'https', host: 'www.youtube.com', path: 'headers/');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Esporte Clube Flamengo"),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/EC_Flamengo-PI_%28BRA%29_2023.png/150px-EC_Flamengo-PI_%28BRA%29_2023.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "EC Flamengo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NossoClubePage()),
                      );
                    },
                    child: ListTile(
                      title: Text("Nosso Clube",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      leading: Icon(Icons.sports_soccer, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      await launchUrl(youtube);
                    },
                    child: ListTile(
                      title: Text("Insta",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      leading: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      const url = 'https://www.ecflamengo.com.br/seja-socio';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: ListTile(
                      title: Text("Seja Sócio",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      leading: Icon(Icons.person_add, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      const url = 'www.google.com';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: ListTile(
                      title: Text("Apoiadores",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      leading: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NossoClubePage extends StatelessWidget {
  const NossoClubePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Nosso Clube"),
      ),
      body: Center(
        child: Text("Página do Nosso Clube"),
      ),
    );
  }
}

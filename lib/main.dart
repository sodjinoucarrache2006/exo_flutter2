import 'package:flutter/material.dart';
import 'pages/accueil.dart';
import 'pages/Layout.dart';
import 'pages/interaction.dart';

void main() {
  runApp(Monappli());
}

class Monappli extends StatelessWidget {
  const Monappli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/accueil': (BuildContext context) => Accueil(),
        '/layouts': (BuildContext context) => Layout(),
        '/Interaction': (BuildContext context) => Interaction(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageActuel = 0;

  final List<Widget> mesPages = [Accueil(), Layout(), Interaction()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Mes widgets", style: TextStyle(color: Colors.white)),
        centerTitle: true,

        //PopuMenuButton
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),

          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    SnackBar _snack1 = SnackBar(
                      content: Text("Ceci est un snakBar"),
                      duration: Duration(seconds: 4),
                      backgroundColor: Colors.blue,
                      action: SnackBarAction(label: 'Close', onPressed: () {}),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(_snack1);
                  },
                  child: Text("Voir profil"),
                ),
              ), //SnackBar
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Alert"),
                          content: Text("Cette pages est pour les widgets"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Fermer"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Paramètres"),
                ),
              ), //AlertDialog
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Layout(),
                      ),
                    );
                  },
                  child: Text("Aller à la page Layout"),
                ),
              ), //Navigator.push
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Quitter"),
                ),
              ), //Navigator.pop(context)
            ],
          ),
        ],
      ),

      //drawer
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Explorateur de widgets",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Accueil"),
              onTap: () {
                Navigator.pushNamed(context, '/accueil');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.touch_app),
              title: Text("Boutons"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.view_column),
              title: Text("Mise en page (Layouts)"),
              onTap: () {
                Navigator.pushNamed(context, '/layouts');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text("Stepper"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("SnackBar & AlertDialog"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Apropos"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Infos"),
                      content: Text(
                        "Cette application presente l'ensemble des wigdets que j'ai appris",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Fermer"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
   
          Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Déconnexion / Quitter"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      //bottonnavigationBar
      body: mesPages[pageActuel],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.blueGrey)),
        ),
        child: BottomNavigationBar(
          currentIndex: pageActuel,
          onTap: (index) {
            setState(() {
              pageActuel = index;
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.home),
                decoration: BoxDecoration(
                  color: pageActuel == 0
                      ? Colors.blueAccent
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              label: 'Accueil',
            ),

            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.dashboard),
                decoration: BoxDecoration(
                  color: pageActuel == 1
                      ? Colors.blueAccent
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              label: 'Layouts',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.touch_app),
                decoration: BoxDecoration(
                  color: pageActuel == 2
                      ? Colors.blueAccent
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
              label: 'Interaction',
            ),
          ],
        ),
      ),
    );
  }
}

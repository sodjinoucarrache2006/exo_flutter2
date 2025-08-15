import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Interaction extends StatelessWidget {
  const Interaction({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyInteractionPage(),
    );
  }
}

class MyInteractionPage extends StatefulWidget {
  const MyInteractionPage({super.key});

  @override
  State<MyInteractionPage> createState() => _MyInteractionPageState();
}

class _MyInteractionPageState extends State<MyInteractionPage> {
  int index = 0;
  final List<Step> _steps = [
    Step(title: Text("Niveau1"), content: Text("Apprentisages de dart")),
    Step(
      title: Text("Niveau2"),
      content: Text("Aprentissages des widgets de bases"),
    ),
    Step(
      title: Text("Niveau3"),
      content: Text("Familiarier avec les nes Navigator.puch et popo"),
    ),
    Step(title: Text("Niveau4"), content: Text("Les widgets avancer ")),
    Step(
      title: Text("Niveau5"),
      content: Text("Les données , sqlite et Firebase"),
    ),
    Step(
      title: Text("Niveau6"),
      content: Text("Créaction d'une application robuste"),
    ),
  ];

  void incrementaion() {
    if (index < _steps.length - 1) {
      setState(() {
        index++;
      });
    }
  }

  void decrementation() {
    if (index > 0) {
      setState(() {
        index--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.all(8)),
              Center(
                child: Text(
                  "Ceci est un stepper du niveau de mon apprentissage !",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),

              Center(
                child: Stepper(
                  
                  steps: _steps,
                  onStepContinue: incrementaion,
                  onStepCancel: decrementation,
                  currentStep: index,
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  SnackBar snap2 = SnackBar(
                    content: Text("Ceci est la pour declacer un snackBar"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.blueGrey,
                    action: SnackBarAction(label: 'Close', onPressed: () {}),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snap2);
                },
                child: Text("SnackBar"),
              ),

              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Infos"),
                        content: Text(
                          "Visiter bien mon appli !",

                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
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
                child: Text("AlerDialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

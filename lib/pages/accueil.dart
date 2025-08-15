import 'package:flutter/material.dart';






class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        height: 700,
        width: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          
        ),
        child: Center(
              child: Column(
                children: [
                  Text("Bienvenue !",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        ElevatedButton(onPressed: (){}, child: Text("ElevatedButton",
                        style: TextStyle(
                          fontSize: 20
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue
                        ),
                        ),
                      ],),
                      Column(
                        children: [
                          OutlinedButton(onPressed: (){},
                           child: Text("OutlineButton",
                           style: TextStyle(
                            fontSize: 18
                           ),
                           ),
                          style: OutlinedButton.styleFrom(
                            
                            foregroundColor: Colors.blue
                          ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(onPressed: (){}, child: Text("TextButton"),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              foregroundColor: Colors.white,
                          ),)
                        ],
                      ),
                    ],
                  ),
                 Padding(padding: EdgeInsets.all(8)),
                  Image.asset(
                  'assets/images/Mobile _App.jpeg',
                  height: 220,
                  width: 500,
                  fit: BoxFit.cover,
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Image.asset("assets/images/image2.jpeg",
                  height: 220,
                  width: 500,
                  fit: BoxFit.cover,
                  ),
                ],
              ),
        ),
      ),
      )
    );
  }
}
import 'package:flutter/material.dart';


class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLayoutPage(),
    );
  }
}


class MyLayoutPage extends StatefulWidget {
  const MyLayoutPage({super.key});

  @override
  State<MyLayoutPage> createState() => _MyLayoutPageState();
}

class _MyLayoutPageState extends State<MyLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.green,
          ),

          Expanded(child: 
          Row(
            children: [
              Container(
                width: 25,
                color: Colors.teal,
              ),

              Expanded(child: Container(
                color: Colors.yellowAccent,
              )),
            Container(
              color: Colors.orange,
              height: 50,
            ),
            ],
          )
          ),

          Container(
            color: Colors.redAccent,
            height: 100,
          ),


          ElevatedButton(onPressed: (){}, child: Text("Retour"))
        ],
      ),
    );
  }
}
import "dart:math";
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foods',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> foods = [
    "Pasul",
    "Dollme",
    "Gullash"
  ];
  List<String> foods2 = [];
  //initState perdoret kur na nevojitet qe te inicializojmm nje metod apo funksion ne hapje te pare te ketij file-i
  //ketu ne listen foods2 eshte shtuar komplet lista foods
  @override
  void initState() {
    foods2.addAll(foods);
  }

  //nje kontrollues per nje textfield, kur eshte textfieldi i lidhur me textEditingController
  //nese modifikohet teksti, textfieldi do te njoftohet dhe do te behet update
  TextEditingController controller = TextEditingController();
  bool isDeleted = false;
  
  //add a dispose method to dispose the controller

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Foods"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              height: 150,
              width: 200,
              color: Colors.cyan,
              child: Text(
                isDeleted ? foods[0] : foods2[0],
                style: TextStyle(fontSize: 40),
              ),
            ),
            //textfieldi per te shkruar ushqimin ne kete rast, ku therret controllerin e
            //deklaruar me lart, dhe pranon deri 20 karaktere.
            TextField(
              controller: controller,
              maxLength: 20,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Add Items',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //kur behet click merr tekstin e shkruar ne text field dhe e shton ne listen foods2
                  setState(() {
                    foods2.add(controller.text);

                    print(foods2);
                  });
                }),
            RaisedButton(
                color: Colors.yellow,
                child: Text(
                  'Zgjedh',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //kur klikohet nese variabla isDeleted eshte true behet shuffle foods
                  //nese eshte false behet foods2 shuffle
                  setState(() {
                    isDeleted ? foods.shuffle() : foods2.shuffle();
                  });
                  print(foods);
                  print(foods2);
                }),
            RaisedButton(
              color: Colors.red,
              child: Text(
                'Delete List',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                //fshin te gjitha elementet ne listen foods2
                setState(() {
                  isDeleted = true;
                  foods2.clear();
                  print(foods);
                  print(foods2);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

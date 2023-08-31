import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(title: 'Counter App', home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String infoText = "Pode Entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        infoText = "Mundo Invertido!";
      } else if (_people <= 10) {
        infoText = "Pode Entrar!";
      } else {
        infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurante.jpeg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'Pessoas: $_people',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {
                      _changePeople(1);
                    },
                    child: Text(
                      '+1',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {
                      _changePeople(-1);
                    },
                    child: Text(
                      '-1',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    )),
              )
            ],
          ),
          Text(
            infoText,
            style: TextStyle(
                color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),
          )
        ]),
      ],
    );
  }
}

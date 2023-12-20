import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _position = 0.0;
  double _velocity = 5.0; // Vitesse initiale

  void _updatePosition() {
    setState(() {
      _position += _velocity; // Utilisation de la vitesse pour déplacer le carré
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Utilisation d'un Timer pour mettre à jour la vitesse et la position toutes les 500ms
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _velocity = _generateRandomVelocity(); // Modifier la vitesse (simulée ici)
        _updatePosition();
        print('Vitesse: $_velocity'); // Affichage de la vitesse dans la console
      });
    });
  }

  double _generateRandomVelocity() {
    // Génération aléatoire d'une vitesse entre -10.0 et 10.0
    return (-10.0 + (20.0 * (Random().nextDouble())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Box'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vitesse: $_velocity',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 100,
              height: 100,
              color: Colors.red,
              margin: EdgeInsets.only(top: _position),
            ),
          ],
        ),
      ),
    );
  }
}

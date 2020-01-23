import 'package:flutter/material.dart';

class Firework extends StatefulWidget {
  @override
  _FireworkState createState() => _FireworkState();
}

class _FireworkState extends State<Firework> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/fw.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

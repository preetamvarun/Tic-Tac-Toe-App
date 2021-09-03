import 'package:flutter/material.dart';

class WinningScreen extends StatelessWidget {

  final result;
  WinningScreen({this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(result, style: TextStyle(color: Colors.white, fontSize: 40.0),),
      ),
    );
  }
}

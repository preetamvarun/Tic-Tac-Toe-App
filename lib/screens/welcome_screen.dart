import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kProfileContainerColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
              child: Center(
                child: Text(
                  "TIC TAC TOE",
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Carter',
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'XO',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 200.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Carter',
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ReusableButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PickUpScreen()));},
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/widgets/wp_screen_text_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tic_tac_toe/widgets/image_avatar_widget.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      appBar: AppBar(
        backgroundColor: kGameScreenBackgroundColor,
        leading: GestureDetector(
          onTap: (){
            Alert(
              style: AlertStyle(
                backgroundColor: Colors.white,
              ),
              context: context,
              content: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Sound"),
                        Text("Music"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Your Name"),
                        Container(
                          width: 100.0,
                          height: 30.0,
                          child: TextField(
                            decoration: kTextFieldDecoration,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Avatar"),
                      ImageAvatarWidget(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Your Name"),
                        Container(
                          width: 100.0,
                          height: 30.0,
                          child: TextField(
                            decoration: kTextFieldDecoration,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("Avatar"),
                      ImageAvatarWidget(),
                    ],
                  ),
                ],
              ),
            ).show();
          },
          child: Icon(
            Icons.view_headline,
            size: 30.0,
          ),
        ),
        title: Center(child: TextWidget(text: "TIC TAC TOE", fontSize: 35.0,)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LayoutBuilder(
                    builder : (context,constraints) => Text(
                      "X", style: TextStyle(color: kLetterXColor,fontSize: constraints.maxHeight / 2.36,fontFamily: 'Carter'),
                    ),
                  ),LayoutBuilder(
                    builder : (context,constraints) => Text(
                      "O", style: TextStyle(color: kLetterOColor,fontSize: constraints.maxHeight / 2.36,fontFamily: 'Carter'),
                    ),
                  ),
                ],
              ),
            ),
            ReusableButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => PickUpScreen()));},
            text: "Pick A Side",
            ),
          ],
        ),
      ),
    );
  }
}





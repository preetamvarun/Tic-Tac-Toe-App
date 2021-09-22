import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/name_text_field_widget.dart';
import 'package:tic_tac_toe/widgets/row_contains_avatar_and_images1.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';
import 'package:tic_tac_toe/widgets/row_contains_avatar_and_images2.dart';

class COLUMNWIDGET extends StatefulWidget {

  @override
  _COLUMNWIDGETState createState() => _COLUMNWIDGETState();
}

class _COLUMNWIDGETState extends State<COLUMNWIDGET> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text("Settings", style: TextStyle(color: Colors.white,fontSize: 25.0)),
          ),
          kDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sound", style: kSettingsBoxLetterStyle,),
              SizedBox(width: 20.0,),
              IconButton(
                onPressed: (){setState(() { UI.muteSound = !UI.muteSound;}); },
                icon: Icon(
                  UI.muteSound ?  Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ],
          ),
          kDivider,
          NameTextFieldWidget(setP1: true, setP2: false,),
          RowAvatarImages1(),
          kDivider,
          NameTextFieldWidget(setP1: false, setP2: true,),
          RowAvatarImages2(),
          kDivider,
          Column(
            children: [
              Row(
                children: [
                  Text("Win Score", style: kYourTurnText,),
                  SizedBox(width: 18.0,),
                  Container(
                    child: Row(
                      children: [
                        buildIconButton(true,false,Icons.arrow_upward),
                        Text(UI.noOfWins.toString(), style: kYourTurnText,),
                        buildIconButton(true, false, Icons.arrow_downward),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Draw Score', style: kYourTurnText,),
                  SizedBox(width: 10.0,),
                  Container(
                    child: Row(
                      children: [
                        buildIconButton(false, true, Icons.arrow_upward),
                        Text(UI.noOfDraws.toString(), style: kYourTurnText,),
                        buildIconButton(false, true, Icons.arrow_downward),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  IconButton buildIconButton(bool wins, bool draws ,IconData iconSymbol) {
    return IconButton(
      onPressed: (){
        if(wins == true && draws == false){
          if(iconSymbol == Icons.arrow_upward){
            if(UI.noOfWins < 5) {setState(() {
              UI.noOfWins++;
            });}
          }
          else if(iconSymbol == Icons.arrow_downward){
            if(UI.noOfWins > 1) {setState(() {
              UI.noOfWins--;
            });}
          }
          print(UI.noOfWins);
        }
        else if(wins == false && draws == true){
          if(iconSymbol == Icons.arrow_upward){
            if(UI.noOfDraws < 5) {setState(() {
              UI.noOfDraws++;
            });}
          }
          else if(iconSymbol == Icons.arrow_downward){
            if(UI.noOfDraws > 1) {setState(() {
              UI.noOfDraws--;
            });}
          }
          print(UI.noOfDraws);
        }
      },
      icon: CircleAvatar(
        backgroundColor: kGameScreenBackgroundColor,
        child: Icon(
          iconSymbol,
          color: Colors.white,
        ),
      ),
    );
  }
}
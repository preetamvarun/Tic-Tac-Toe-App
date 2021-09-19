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
        ],
      ),
    );
  }
}
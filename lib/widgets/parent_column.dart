import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/name_text_field_widget.dart';
import 'package:tic_tac_toe/widgets/row_contains_avatar_and_images.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';

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
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
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
          ),
          NameTextFieldWidget(name: "Player 1",),
          RowAvatarImages(),
          NameTextFieldWidget(name: "Player 2",),
          RowAvatarImages(),
        ],
      ),
    );
  }
}
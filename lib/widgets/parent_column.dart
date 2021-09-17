import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/name_text_field_widget.dart';
import 'package:tic_tac_toe/widgets/row_contains_avatar_and_images.dart';
import 'package:tic_tac_toe/Models/UiLogic.dart';

String? dropDownValue;

class COLUMNWIDGET extends StatefulWidget {

  @override
  _COLUMNWIDGETState createState() => _COLUMNWIDGETState();
}

class _COLUMNWIDGETState extends State<COLUMNWIDGET> {

  List<String> gridSize = ["3 * 3 Grid","4 * 4 Grid","5 * 5 Grid"];

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          Text("Select Grid Size", style: kSettingsBoxLetterStyle,),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: kProfileContainerColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: kProfileContainerColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropDownValue,
                    icon: Icon(Icons.arrow_downward,color: Colors.white,),
                    iconSize: 24.0,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                    onChanged: (String? newValue){
                      setState(() {
                        dropDownValue = newValue;
                      });
                    },
                    items : gridSize.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem(value: value, child: Text(value, style: TextStyle(color: Colors.white),),);
                    }).toList(),
                  ),
                ),
              ),
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
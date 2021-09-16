import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/widgets/name_text_field_widget.dart';
import 'package:tic_tac_toe/widgets/row_contains_avatar_and_images.dart';

class COLUMNWIDGET extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sound", style: kSettingsBoxLetterStyle,),
                Text("Music",style: kSettingsBoxLetterStyle,),
              ],
            ),
          ),
          NameTextFieldWidget(),
          RowAvatarImages(),
          NameTextFieldWidget(),
          RowAvatarImages(),
        ],
      ),
    );
  }
}
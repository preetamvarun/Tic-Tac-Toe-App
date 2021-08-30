import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/profile_container_widget.dart';
import 'package:tic_tac_toe/widgets/wrapping_container.dart';
import 'package:tic_tac_toe/constants.dart';

class GameScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: ProfileContainer(profileName: "Satoru", letter : "X",imageName: 'satoru',),
                  ),
                  ProfileContainer(profileName: "Jack", letter : "O",imageName: 'mine',),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kGameScreenContainerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                      GestureDetector(onTap : (){},child: WrappingContainer()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

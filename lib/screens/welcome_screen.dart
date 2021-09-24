import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/pickup_screen.dart';
import 'package:tic_tac_toe/widgets/reusable_button.dart';
import 'package:tic_tac_toe/widgets/wp_screen_text_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tic_tac_toe/widgets/parent_column.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final keyOne = GlobalKey();

  @override
  void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((_) =>
    ShowCaseWidget.of(context)!.startShowCase([keyOne]),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGameScreenBackgroundColor,
      appBar: AppBar(
        backgroundColor: kGameScreenBackgroundColor,
        leading: Showcase(
          key: keyOne,
          description: 'Set up your profile',
          showcaseBackgroundColor: kProfileContainerColor,
          contentPadding: EdgeInsets.all(8),
          overlayOpacity: 0.75,
          showArrow: true,
          shapeBorder: CircleBorder(),
          descTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          child: IconButton(
            onPressed: (){
              Alert(
                style: AlertStyle(
                  backgroundColor: Color(0xFF9b70e5),
                  alertPadding: EdgeInsets.symmetric(horizontal: 25.0),
                ),
                context: context,
                content: COLUMNWIDGET(),
              buttons: [
                DialogButton(
                  onPressed: (){Navigator.pop(context);},
                  child: Text(
                    "Done",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ]).show();
            },
            icon : Icon(
              Icons.view_headline,
              size: 30.0,
            ),
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






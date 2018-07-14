import 'package:flutter/material.dart';
import 'package:RodFaiFah/matching_screen.dart';
import 'package:RodFaiFah/waiting_screen.dart';

class ConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String appTitle = 'RodFaiFahMaHaNaTel2 ❤';
    String text1 = 'จุดนัดพบอยู่ที่สถานี';
    String text2 = '\" หมอชิต \"';
    String text3 = 'คุณประหยัดไปได้';
    String text4 = '58 บาท';
    
    TextStyle appTitleStyle = new TextStyle (
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );

    TextStyle appTextStyle = new TextStyle (
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      color: Colors.blue,
    );

    TextStyle appValueStyle = new TextStyle (
      fontSize: 36.0,
      fontWeight: FontWeight.w900,
      color: Colors.blue,
    );

    TextStyle buttonConfirmTextStyle = new TextStyle (
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );

    TextStyle buttonCancelTextStyle = new TextStyle (
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.blue,
    );

    Widget buttonConfirm = new RaisedButton(
      child: Text(
        'ตกลง',
        style: buttonConfirmTextStyle,
      ),
      color: Colors.blue,
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WaitingScreen()),
        );
      },
    );

    Widget buttonCancel = new RaisedButton(
      child: Text(
        'ยกเลิก',
        style: buttonCancelTextStyle,
      ),
      color: Colors.white,
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MatchingScreen()),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle, style: appTitleStyle),
      ),
      body: Container(
        margin: new EdgeInsets.all(20.0),
        child: new Column(
          children: [
            Expanded(
              child: new Card(
                child: new Column(
                  children: [
                    Container(
                      margin: new EdgeInsets.only(top: 60.0),
                    ),
                    Text(text1, style: appTextStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 10.0),
                    ),
                    Text(text2, style: appValueStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 50.0),
                    ),
                    Text(text3, style: appTextStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 10.0),
                    ),
                    Text(text4, style: appValueStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 10.0),
                    ),
                  ],  
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.only(top: 10.0),
            ),
            new ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              child: buttonConfirm
            ),
            Container(
              margin: new EdgeInsets.only(top: 10.0),
            ),
            new ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              child: buttonCancel
            ),
          ],
        )
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:RodFaiFah/matching_screen.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'RodFaiFahMaHaNaTel2 ❤';
    String blankLine = '';
    String detail1 = 'คู่ของคุณอยู่ที่สถานี';
    String detail2 = 'จุดนัดพบสถานี';
    String stationName = '" อารีย์ "';

    TextStyle titleStyle = new TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    
    TextStyle detailStyle = new TextStyle(
      fontWeight: FontWeight.bold,
    );

    TextStyle stationStyle = new TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    Widget buttonCancel = new RaisedButton(
      child: Text('ยกเลิก'),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MatchingScreen()),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: new Column(
          children: [
            Text(blankLine),
            Text(detail1, style: titleStyle),
            Image.asset('images/test.png', scale: 0.5),
            Text(detail2, style: detailStyle),
            Text(stationName, style: stationStyle),
            Text(blankLine),
            buttonCancel
          ],
        ),
      )
    );
  }
}

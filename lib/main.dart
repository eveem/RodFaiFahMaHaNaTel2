import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MatchingScreen(),
  ));
}

class MatchingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MatchingScreen> {
  @override
  List<String> _values = new List<String>();
  String _value = null;
  void initState() {
    _values.addAll(["หมอชิต", "สะพานควาย", "อารีย์", "สนามเป้า", "อนุสาวรีย์ชัยสมรภูมิ", "พญาไท", "ราชเทวี",
                    "สยาม", "ชิดลม", "เพลินจิต", "นานา", "อโศก", "พร้อมพงษ์", "ทองหล่อ", "เอกมัย", "พระโขนง",
                    "อ่อนนุช", "บางจาก", "ปุณณวิถี", "อุดมสุข", "บางนา", "แบริ่ง", "สำโรง", "สนามกีฬาแห่งชาติ", "ราชดำริ",
                    "ศาลาแดง", "ช่องนนทรี", "สุรศักดิ์", "สะพานตากสิน", "กรุงธนบุรี", "วงเวียนใหญ่"]);
    _value = _values.elementAt(0);
  }
  void _onChange(String value) {
    setState(() {
      _value = value;      
    });
  }

  Widget build(BuildContext context) {
    String appTitle = 'RodFaiFahMaHaNaTel2 ❤';
    String blankLine = '';
    String detail1 = 'ตอนนี้คุณอยู่สถานี';
    String stationName = '" สยาม "';
    String detail2 = 'เลือกสถานีปลายทาง';

    Widget buttonAccept = new RaisedButton(
      child: Text('จับคู่'),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConfirmScreen()),
        );
      },
    );

    TextStyle stationStyle = new TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    TextStyle detailStyle = new TextStyle(
      fontSize: 28.0,
    );

    Widget dropDownStation = new DropdownButton(
      value: _value,
      items: _values.map((String value){
      return new DropdownMenuItem(
        value: value,
        child: new Row(
        children: <Widget>[
                  new Icon(Icons.train),
                  new Text('   สถานี${value}')
                  ],
                ),
      );
    }).toList(),
        onChanged: (String value){_onChange(value);},
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(appTitle),
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
                    Text(detail1, style: detailStyle),
                    Text(stationName, style: stationStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 20.0),
                    ),
                    Text(detail2, style: detailStyle),
                    dropDownStation,
                    buttonAccept
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

class WaitingScreen extends StatelessWidget {
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
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
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    TextStyle detailStyle = new TextStyle(
      fontWeight: FontWeight.bold,
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
      body: Center(
        child: new Column(
          children: <Widget>[
            Text(blankLine),
            Text(detail1, style: detailStyle),
            Text(stationName, style: stationStyle),
            Text(blankLine),
            Text(detail2, style: detailStyle),
            dropDownStation,
            buttonAccept
          ],
        ),
      )
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
    String text2 = 'หมอชิต';
    String text3 = 'คุณประหยัดไปได้';
    String text4 = 'xxx บาท';
    
    TextStyle appTitleStyle = new TextStyle (
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.blue,
    );

    TextStyle appTextStyle = new TextStyle (
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.blue,
    );

    Widget buttonConfirm = new RaisedButton(
      child: const Text('ตกลง'),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WaitingScreen()),
        );
      },
    );

    Widget buttonCancel = new RaisedButton(
      child: const Text('ยกเลิก'),
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
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: [
            Text(text1, style: appTextStyle),
            Text(text2, style: appTextStyle),
            Text(text3, style: appTextStyle),
            Text(text4, style: appTextStyle),
            buttonConfirm,
            buttonCancel,
          ],
        )
      )
    );
  }
}
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

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('ยกเลิก'),
        ),
      ),
    );
  }
}

class _State extends State<MatchingScreen> {
  String _value = null;
  List<String> _values = new List<String>();

  @override
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


    Column buildButtonColumn(String label) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
              ),
            )
          )
        ]
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RodFaiFahMaHaNaTel2 ❤'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            Text('ตอนนี้คุณอยู่สถานี'),
            Text('" สยาม "',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
              ),
            ),
            Text('เลือกสถานีปลายทาง'),
            new DropdownButton(
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
            ),
            new RaisedButton(
              child: const Text('จับคู่'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultScreen()),
                );
              },
            ),
            new RaisedButton(
              child: const Text('Go to Confirm Screen'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfirmScreen()),
                );
              },
            ),
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
          MaterialPageRoute(builder: (context) => ResultScreen()),
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
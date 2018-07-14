import 'package:flutter/material.dart';
import 'package:RodFaiFah/confirm_screen.dart';

class MatchingScreen extends StatefulWidget {
  @override
  _MatchingScreenState createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
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
          MaterialPageRoute(builder: (context) => new ConfirmScreen()),
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
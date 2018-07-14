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

class WaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RodFaiFahMaHaNaTel2 ❤'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Text(''),
            Text(
              'คู่ของคุณอยู่ที่สถานี',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('images/test.png', scale: 0.5),
            Text(
              'จุดนัดพบสถานี',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '" อารีย์ "',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.green,
              ),
            ),
            Text(''),
            new RaisedButton(
              child: Text('ยกเลิก'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MatchingScreen()),
                );
              },
            )
          ],
        ),
      )
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RodFaiFahMaHaNaTel2 ❤'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            Text(''),
            Text(
              'ตอนนี้คุณอยู่สถานี',
            ),
            Text(
              '" สยาม "',
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
                  MaterialPageRoute(builder: (context) => WaitingScreen()),
                );
              },
            )
          ],
        ),
      )
    );
  }
}

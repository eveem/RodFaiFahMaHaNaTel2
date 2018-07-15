import 'dart:async';
import 'package:flutter/material.dart';
import 'package:RodFaiFah/confirm_screen.dart';
import 'package:http/http.dart' as http;

class MatchingScreen extends StatefulWidget {
  @override
  _MatchingScreenState createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  List<String> stations;
  String destination;
  String source;
  
  @override
  void initState() {
    super.initState();
    stations = new List<String>();
    stations.addAll([
      "หมอชิต",
      "สะพานควาย",
      "อารีย์",
      "สนามเป้า",
      "อนุสาวรีย์ชัยสมรภูมิ",
      "พญาไท",
      "ราชเทวี",
      "สยาม",
      "ชิดลม",
      "เพลินจิต",
      "นานา",
      "อโศก",
      "พร้อมพงษ์",
      "ทองหล่อ",
      "เอกมัย",
      "พระโขนง",
      "อ่อนนุช",
      "บางจาก",
      "ปุณณวิถี",
      "อุดมสุข",
      "บางนา",
      "แบริ่ง",
      "สำโรง",
      "สนามกีฬาแห่งชาติ",
      "ราชดำริ",
      "ศาลาแดง",
      "ช่องนนทรี",
      "สุรศักดิ์",
      "สะพานตากสิน",
      "กรุงธนบุรี",
      "วงเวียนใหญ่",
    ]);
    
    destination = stations.elementAt(0);
    source = "อุดมสุข";

    new Timer.periodic(const Duration(seconds: 1), (Timer t) => setStation());
  }

  void _onChange(String value) {
    setState(() {
      destination = value;      
    });
  }

  void getMatching(String destination) async {
    final url = "http://192.168.1.96:3001/api/healthcheck";
    // final url = "http://localhost:3001/matching?s="${source}"&d="${destination}"";
    var client = new http.Client();
    var response = await client.get(url);
    var matched = false;

    if (response.statusCode == 200) {
      print("source: ${this.source}");
      print("destination: ${destination}");

      if (matched) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new ConfirmScreen(
            sid: "2",
            did: "3",
            station: "อโศก", 
            ticket: "เอกมัย", 
            source: this.source,
            destination: destination,
            price: 43,
            matched: true,
          )),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new ConfirmScreen(
            sid: null,
            did: null,
            station: "........", 
            ticket: "........", 
            source: this.source,
            destination: destination,
            price: 0,
            matched: false,
          )),
        );
      }
    }
  }

  Future<dynamic> setStation() async {
    print('setStation');
    
    final url = "http://192.168.1.96:3001/api/healthcheck";
    // final url = "http://localhost:3001/tracking";
    var client = new http.Client();
    var response = await client.post(url, body: { "id": "1", "station": "อโศก" });

    // if (response.statusCode == 200) {
    //   // print(source);
    //   // print(destination);

    //   // setState(() {
    //   //   source = "อโศก";
    //   // });

    //   // setState(() {
    //   //   source = "อโศก";      
    //   // });
    // }

    setState(() {
      source = "อโศก";      
    });
  }
  
  Widget build(BuildContext context) {
    String appTitle = "RodFaiFahMaHaNaTel2 ❤";
    String detail1 = "ตอนนี้คุณอยู่สถานี";
    String stationName = "\" ${source} \"";
    String detail2 = "เลือกสถานีปลายทาง";

    TextStyle buttonConfirmTextStyle = new TextStyle (
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );

    Widget buttonAccept = new RaisedButton(
      child: Text('จับคู่', style: buttonConfirmTextStyle),
      color: Colors.blue,
      onPressed: (){ getMatching(destination); },
    );

    TextStyle stationStyle = new TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );

    TextStyle detailStyle = new TextStyle(
      fontSize: 32.0,
    );

    Widget dropDownStation = new DropdownButton(
      value: destination,
      items: stations.map((String name){
      return new DropdownMenuItem(
        value: name,
        child: new Row(
        children: <Widget>[
                  new Icon(Icons.train),
                  new Text("   สถานี${name}")
                  ],
                ),
      );
    }).toList(),
        onChanged: (String value){ _onChange(value); },
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
                      margin: new EdgeInsets.only(top: 30.0),
                    ),
                    Text(detail1, style: detailStyle),
                    Text(stationName, style: stationStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 40.0),
                    ),
                    Text(detail2, style: detailStyle),
                    dropDownStation,
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
              child: buttonAccept,
            )
          ],
        )
      ),
    );
  }
}
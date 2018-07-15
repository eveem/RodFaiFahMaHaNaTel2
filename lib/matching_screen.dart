import 'dart:async';
import 'dart:convert';
import 'dart:math';
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
  String uid;
  
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

    final _random = new Random();
    source = stations[_random.nextInt(stations.length)];
  }

  void _onChange(String value) {
    setState(() {
      destination = value;      
    });
  }

  void startMatching() async {
    print('MATCHING => startMatching');
    await createUser(destination);
    await getMatching(destination);
  }

  void createUser(String destination) async {
    print('MATCHING => createUser');

    final url = "https://17ed1999.ap.ngrok.io/users";
    final body = {
      "source": source,
      "destination": destination,
    };

    var client = new http.Client();
    var response = await client.post(url, body: body);

    var result = json.decode(response.body);
    print(result['user']['id']);

    setState(() {
      uid = result['user']['id']; 
    });
  }

  void getMatching(String destination) async {
    print('MATCHING => getMatching');

    // final url = "http://192.168.180.251:3001/api/healthcheck";
    final url = "http://17ed1999.ap.ngrok.io/matching";
    final body = {
      "id": uid,
    };
    
    var client = new http.Client();
    var response = await client.post(url, body: body);
    var result = json.decode(response.body);

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new ConfirmScreen(
          sid: uid,
          did: result['matched_user_id'],
          station: result['meeting_station'], 
          ticket: result['buy_destination'], 
          source: this.source,
          destination: destination,
          price: 47,
          matched: false,
        )),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => new ConfirmScreen(
          sid: uid,
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
      onPressed: startMatching,
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
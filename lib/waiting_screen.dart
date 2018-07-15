import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:RodFaiFah/matching_screen.dart';
import 'package:RodFaiFah/map_util.dart';
import 'package:map_view/map_view.dart';

const API_KEY = "AIzaSyBOuG9Q-whmF3PApyDtUqeQ1GMKVZKvEhA";
class WaitingScreen extends StatefulWidget {
  final String station;
  final String sid;
  final String did;

  WaitingScreen({
    Key key,
    this.station,
    this.sid,
    this.did,
  }) : super(key: key);

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  List<String> listStation;
  String imagePath = 'images/h.png';

  MapView mapView;
  MapUtil mapUtil;

  @override
  void initState() {
    super.initState();
    MapView.setApiKey(API_KEY);
    mapUtil = new MapUtil();
    mapUtil.init();
    mapView = new MapView();

    listStation = new List<String>();
    listStation.addAll([
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

    new Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setStation();
      setImage();
    });
  }

  Future<dynamic> setImage() async {
    print('WAITING => setImages');

    print('Source ID: ${widget.sid}');
    print('Destination ID: ${widget.did}');
    
    final url = "http://17ed1999.ap.ngrok.io/tracking/${widget.did}";
    var client = new http.Client();
    var response = await client.get(url);
    var result = json.decode(response.body);
    var picName = result['station'];
    
    print('result');
    print(result);
    
    print('picName');
    print(picName);

    setState(() {
      imagePath = "images/${picName}.png";
    });
  }

  Future<dynamic> setStation() async {
    print('WAITING => setStation');

    // final url = "http://17ed1999.ap.ngrok.io/tracking/${widget.did}";
    // var data = {
    //   "id": widget.sid,
    // };
    
    // var client = new http.Client();
    // var response = await client.post(url, { data: data });

    final _random = new Random();

    final url = "http://17ed1999.ap.ngrok.io/tracking/${widget.sid}";
    final body = {
      "station": listStation[_random.nextInt(listStation.length)],
    };
    
    var client = new http.Client();
    var response = await client.post(url, body: body);

    var result = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'RodFaiFahMaHaNaTel2 ❤';
    String detail1 = 'คู่ของคุณอยู่ที่';
    String detail2 = 'จุดนัดพบอยู่ที่สถานี';
    String stationName = '" ${widget.station} "';
    
    
    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('การแลกเปลี่ยนสำเร็จ'),
            content: new Text('ขอบคุณที่ใช้บริการ'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('ปิด'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchingScreen()),
                  );
                },
              ),
            ],
          );
        }
      );
    }

    TextStyle textStyle = new TextStyle(
      fontSize: 32.0,
    );

    TextStyle stationStyle = new TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
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

    Widget buttonCancel = new RaisedButton(
      child: Text('ยกเลิก', style: buttonCancelTextStyle),
      color: Colors.white,
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MatchingScreen()),
        );
      },
    );

    Widget buttonDone = new RaisedButton(
      child: Text('แลกเปลี่ยนสำเร็จ', style: buttonConfirmTextStyle),
      color: Colors.blue,
      onPressed: _showDialog,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
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
                      margin: new EdgeInsets.only(top: 5.0),
                    ),
                    Text(detail1, style: textStyle),
                    Card(
                      margin: new EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0, bottom: 20.0),
                      child: new GestureDetector(
                        onTap: () => mapUtil.showMap(mapView),
                        child: new Center(
                          child: new Image.asset(imagePath, height: 200.0),
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.only(top: 20.0),
                    ),
                    Text(detail2, style: textStyle),
                    Text(stationName, style: stationStyle),
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
              child: buttonDone,
            ),
            Container(
              margin: new EdgeInsets.only(top: 10.0),
            ),
            new ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              child: buttonCancel,
            ),
          ],
        ),
      ),
    );
  }
}

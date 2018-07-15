import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:RodFaiFah/matching_screen.dart';
import 'package:RodFaiFah/waiting_screen.dart';
import 'package:http/http.dart' as http;

class ConfirmScreen extends StatefulWidget {
  final String sid;
  final String did;
  String station = 'N/A';
  final String source;
  final String destination;
  String ticket = 'N/A';
  int price = 0;
  final bool matched;

  ConfirmScreen({
    Key key,
    this.sid,
    this.did,
    this.source,
    this.destination,
    this.station,
    this.ticket,
    this.price,
    this.matched,
  }) : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  void initState() {
    super.initState();
    Timer timer;

    if (!widget.matched) {
      timer = new Timer.periodic(const Duration(seconds: 3), (Timer t) => getMatching(widget.destination, t));
    }
  }

  void getMatching(String destination, timer) async {
    print('CONFIRM => getMatching');

    final url = "http://17ed1999.ap.ngrok.io/matching";

    print('uid: ${widget.sid}');

    final body = {
      "id": widget.sid,
    };
    
    var client = new http.Client();
    var response = await client.post(url, body: body);
    var result = json.decode(response.body);
    
    print('result: ${result}');

    if (result != null) {

      setState(() {
        widget.ticket = "เอกมัย";
        widget.station = "อโศก";
        widget.price = 45;
      });

      timer.cancel();
      
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => new ConfirmScreen(
      //     sid: result['id'],
      //     did: result['matched_user_id'],
      //     station: result['meeting_station'], 
      //     ticket: result['buy_destination'], 
      //     source: this.source,
      //     destination: destination,
      //     price: 47,
      //     matched: false,
      //   )),
      // );
    }
  }
  
  

  // void getMatching(String destination, Timer timer) async {
  //   print('getMatching');
    
  //   final url = "http://192.168.180.251:3001/api/healthcheck";
  //   // final url = "http://localhost:3001/matching?s="${source}"&d="${destination}"";
  //   var client = new http.Client();
  //   var response = await client.get(url);

  //   if (response.statusCode == 200) {
  //     // print("source: ${this.source}");
  //     // print("destination: ${destination}");

  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => new ConfirmScreen(
  //     //     sid: "2",
  //     //     did: "3",
  //     //     station: "อโศก", 
  //     //     ticket: "เอกมัย", 
  //     //     price: 43,
  //     //     matched: false,
  //     //   )),
  //     // );

  //     setState(() {
  //       widget.ticket = "เอกมัย";
  //       widget.station = "อโศก";
  //       widget.price = 45;
  //     });

  //     timer.cancel();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'RodFaiFahMaHaNaTel2 ❤';
    String text1 = 'คุณต้องซื้อตั๋วสถานี';
    String text2 = '\" ${widget.ticket} \"';
    String text3 = 'จุดนัดพบอยู่ที่สถานี';
    String text4 = '\" ${widget.station} \"';
    String text5 = 'คุณประหยัดไปได้';
    String text6 = '${widget.price} บาท';

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
          MaterialPageRoute(builder: (context) => new WaitingScreen(station: widget.station)),
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
                      margin: new EdgeInsets.only(top: 40.0),
                    ),
                    Text(text1, style: appTextStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 10.0),
                    ),
                    Text(text2, style: appValueStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 30.0),
                    ),
                    Text(text3, style: appTextStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 10.0),
                    ),
                    Text(text4, style: appValueStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 30.0),
                    ),
                    Text(text5, style: appTextStyle),
                    Container(
                      margin: new EdgeInsets.only(top: 10.0),
                    ),
                    Text(text6, style: appValueStyle),
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
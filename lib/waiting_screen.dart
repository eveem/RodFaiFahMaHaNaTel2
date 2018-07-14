import 'package:flutter/material.dart';
import 'package:RodFaiFah/matching_screen.dart';
import 'package:RodFaiFah/map_util.dart';
import 'package:map_view/map_view.dart';
const API_KEY = "AIzaSyBOuG9Q-whmF3PApyDtUqeQ1GMKVZKvEhA";
class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {

  MapView mapView;
  MapUtil mapUtil;

  @override
  void initState() {
    super.initState();
    MapView.setApiKey(API_KEY);
    mapUtil = new MapUtil();
    mapUtil.init();
    mapView = new MapView();
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'RodFaiFahMaHaNaTel2 ❤';
    String detail1 = 'คู่ของคุณอยู่ที่สถานี';
    String detail2 = 'จุดนัดพบสถานี';
    String stationName = '" อารีย์ "';
    
    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('การแลกเปลี่ยนสำเร็จ'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('กลับหน้าหลัก'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchingScreen()),
                  );
                },
              ),
              new FlatButton(
                child: new Text('ปิด'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
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
      // onPressed: (){
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => MatchingScreen()),
      //   );
      // },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        margin: new EdgeInsets.all(20.0),
        child: new Column(
          children: [
<<<<<<< HEAD
            Expanded(
              child: new Card(
                child: new Column(
                  children: [
                    Container(
                      margin: new EdgeInsets.only(top: 5.0),
                    ),
                    Text(detail1, style: textStyle),
                    Image.asset('images/test.png', height: 200.0),
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
=======
            Text(blankLine),
            Text(detail1, style: titleStyle),
            new GestureDetector(
                onTap: () => mapUtil.showMap(mapView),
                child: new Center(
                  child: new Image.asset('images/test.png', scale: 0.5),
                ),
              ),
            Text(detail2, style: detailStyle),
            Text(stationName, style: stationStyle),
            Text(blankLine),
            buttonCancel
>>>>>>> 1a4703da2ee317ada5d00fd1eef78e0978161b7d
          ],
        ),
      ),
    );
  }
}

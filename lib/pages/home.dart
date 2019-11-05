import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Map data = {};
  DateTime currentTime;
  String dateTime;
  Timer _timer;
  int seconds, minutes, hours;
  bool doTimer = false;

  void startTimer() async {
    currentTime = data['realtime'];
    seconds = currentTime.second;
    minutes = currentTime.minute;
    hours = currentTime.hour;

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) => setState(() {
      seconds = seconds + 1;
      //currentTime = currentTime.add(new Duration(seconds: 1));
      //dateTime = DateFormat.jms().format(currentTime);
      //int timee = currentTime.second + 1;
      print(seconds);
      dateTime = DateFormat.jm().format(currentTime);
    },
    ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //startTimer();
  }



  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    dateTime = data['time'];
    currentTime = data['realtime'];
    print(DateFormat.jms().format(currentTime));
    if(doTimer == false) {
      startTimer();
      doTimer = true;
    }
//    Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {
//      dateTime = (int.parse(dateTime) + 1).toString(); }));

      // set background
      String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
      Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

      return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async {
                      /*dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });*/
                      dynamic result = await Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$dateTime:$seconds',
                    //data['time'],
                    style: TextStyle(
                      fontSize: 66,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }


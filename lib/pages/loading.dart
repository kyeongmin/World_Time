import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);

    setState(() {
      time = instance.time;
    });
  }

  @override  //상속받은 클래스의 것을 오버라이드
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('loading'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text(time),
      ),
    );
  }
}

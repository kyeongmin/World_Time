import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    //simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      print('a');
      return 'yoshi';
    });

    //simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'vega, musician & egg collector';
    });

    print('$username - $bio');
  }

  int counter = 0;

  @override  //상속받은 클래스의 것을 오버라이드
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( //appbar가 자동으로 뒤로 버튼 생성해줌
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}

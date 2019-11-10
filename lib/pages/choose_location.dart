import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'flags/uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'flags/greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'flags/egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'flags/kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'flags/usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'flags/usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'flags/south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'flags/indonesia.png'),
  ];

  Map data = {};

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    dynamic result = await Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
      'realtime': instance.realtime,
    });
    // navigate to home screen
    /*Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });*/
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments;
    print(data);

    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( //appbar가 자동으로 뒤로 버튼 생성해줌
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () async{
                  updateTime(index);
                  print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

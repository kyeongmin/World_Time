import 'package:http/http.dart';
import 'dart:convert';

class WorldCountry {
  String name, capital, region, language, flag;

  WorldCountry({this.name, this.capital, this.region, this.language, this.flag});

  Future<void> getCountry() async {
    try {
      // make the request
      Response response = await get(
          'https://raw.githubusercontent.com/mledoze/countries/master/dist/countries.json');
      List data = jsonDecode(response.body);
      print(data[10]);

      Map<String, dynamic> a = data[20];
      print(a.values);


      // get properties from data
      //String countryName = data['name'];
      //String offset = data['utc_offset'].substring(1, 3);
      //print(countryName);
      //print(offset);
//
//      // create DateTime Object
//      DateTime now = DateTime.parse(datetime);
//      now = now.add(Duration(hours: int.parse(offset)));
//
//      realtime = now;
//
//      // set the time property
//      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
//      //time = DateFormat.jm().format(now);
//      time = DateFormat.jms().format(now);
    }
    catch(e){
      print('caught error: $e');
    }
  }

}
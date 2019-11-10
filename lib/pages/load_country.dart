import 'package:flutter/material.dart';
import 'package:world_time/Services/world_country.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadCountry extends StatefulWidget {
  @override
  _LoadCountryState createState() => _LoadCountryState();
}

class _LoadCountryState extends State<LoadCountry> {

  void loadCountryList() async {
    WorldCountry instance = WorldCountry();

    await instance.getCountry();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCountryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
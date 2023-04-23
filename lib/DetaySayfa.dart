import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:namaz_vakitleri/NamazVakitleriApi.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetaySayfa extends StatefulWidget {
  var sehir;

  DetaySayfa({required this.sehir});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  Future<NamazVakitleri> namazVakitleri(String vakit) async {
    var url = Uri.parse("https://api.collectapi.com/pray/all?data.city=$vakit");
    var response = await http.get(url, headers: {
      'Authorization': 'apikey 1Djuv5aGeWJbuue5aWH3bA:2suqPREUSuAyIKSZ3RrirL',
      'Content-Type': 'application/json'
    });
    return NamazVakitleri.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<NamazVakitleri>(
      future: namazVakitleri(widget.sehir),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/wallpaper.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
                child: ListView.builder(
                    itemCount: snapshot.data!.result.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 4,
                            right: MediaQuery.of(context).size.width / 4),
                        child: Card(
                          elevation: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${snapshot.data!.result[index].vakit} - ",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text(snapshot.data!.result[index].saat,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        )),
                                  ]),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

 /*Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DigitalClock(
            hourMinuteDigitTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
            secondDigitTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            is24HourTimeFormat: true,
            showSecondsDigit: true,
            digitAnimationStyle: Curves.bounceInOut,
            colon: Text(
              ':',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),
          )
        ],
      ),
    )*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namaz_vakitleri/DetaySayfa.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sehir = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("image/wallpaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: DigitalClock(
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
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400, left: 20, right: 20),
                child: SizedBox(
                  height: 48,
                  child: TextField(
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-z]")),
                    ],
                    controller: sehir,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'İl Giriniz. Örn: canakkale',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 0,
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetaySayfa(sehir: sehir.text)),
                  );
                },
                child: Icon(Icons.search),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'CityWeatherScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController userInput = TextEditingController();
  late String city;
  void _submitData() {
    if (userInput.text.isEmpty) return;
    city = userInput.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CityWeatherScreen(city)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          // color: Colors.black45,
          height: 120,
          child: Center(
              child: Text(
            'Weatherly',
            style: GoogleFonts.ptSans(
                textStyle:
                    TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          )),
        ),
        Container(
            //color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.6,
            /* decoration: const BoxDecoration(
              //  color: Color.fromARGB(0, 0, 191, 255),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),*/
            child: Lottie.asset('assets/weather.json', fit: BoxFit.contain)),
        Column(children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 40, bottom: 40, right: 40),
            child: TextFormField(
                keyboardAppearance: Brightness.dark,
                controller: userInput,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) => _submitData(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.blue)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter your City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter the City';
                  }
                  return null;
                }),
          ),
        ]),
      ]),
    ));
  }
}

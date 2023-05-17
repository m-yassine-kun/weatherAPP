import 'package:flutter/material.dart';

import '../service/Service.dart';

class PageTwo extends StatelessWidget {
  dynamic data;
  WeatherService weatherModel = WeatherService();

  PageTwo({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wheather App')),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://openweathermap.org/img/wn/${data['weather'][0]['icon']}@2x.png'),
                      width: 50,
                    ),
                Text(" ${data['weather'][0]['main']}  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    )),

              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text(
                    "Temperature ${weatherModel.getWeatherIcon(data['main']['temp'].toInt())}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 32.0,
                    )),
                Text(" ${data['main']['temp'].toInt()}°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    ))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text(" Feels like    ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 33.0,
                    )),
                Icon(Icons.arrow_forward, color: Colors.orange, size: 30),
                Text(" ${data['main']['feels_like'].toInt()}°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    ))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text(" Temp min   ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 33.0,
                    )),
                Icon(Icons.arrow_downward, color: Colors.blue, size: 30),
                Text(" ${data['main']['temp_min'].toInt()}°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    ))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text(" Temp max  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 33.0,
                    )),
                Icon(Icons.arrow_upward, color: Colors.red, size: 30),
                Text(" ${data['main']['temp_max'].toInt()}°",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    ))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text(" Pressure  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 33.0,
                    )),
                Icon(Icons.compare_arrows_outlined, color: Colors.brown, size: 30),
                Expanded(child: Text(" ${data['main']['pressure'].toInt()}Pa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    )))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text(" Humidity  ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 33.0,
                    )),
                Icon(Icons.water_drop, color: Colors.blueGrey, size: 30),
                Text(" ${data['main']['humidity'].toInt()}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    ))
              ]),
              SizedBox(height: 10),
              Row(children: <Widget>[
                Text("Wind speed ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 33.0,
                    )),
                Icon(Icons.wind_power, color: Colors.brown, size: 30),
                Expanded(child: Text(" ${data['wind']['speed'].toInt()}km/h",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Spartan MB',
                      fontSize: 34.0,
                    )))
              ]),
              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }
}

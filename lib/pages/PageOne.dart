import 'package:flutter/material.dart';
import 'package:weather_app/pages/PageTwo.dart';

import '../service/Service.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final _textController = TextEditingController();
  String cityName = 'fes';

  WeatherService weatherModel = WeatherService();
  dynamic AllData;
  String? cn;
  String? country;
  dynamic countries;
  String city = "";
  int temperature = 0;
  int humidity = 0;
  String condition = "";

  //String? weatherIcon;
  String? tempIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wheather App')),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: 'Enter city name',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )),
            ),
            SizedBox(height: 15),
            MaterialButton(
              onPressed: () async {
                setState(() {
                  cityName = _textController.text;
                });
                AllData = await weatherModel.getCityWeather(cityName);
                countries = await weatherModel.getContryName();
                setState(() {
                  cn = AllData['sys']['country'].toLowerCase() as String;

                  country = countries[cn];
                });

                setState(() {
                  humidity = AllData!['main']['humidity'];
                  condition = AllData!['weather'][0]['description'];
                  double temp = AllData['main']['temp'];
                  temperature = temp.toInt();
                  city = AllData['name'];
                  tempIcon = AllData!['weather'][0]['icon'];
                });
              },
              color: Colors.amber,
              child: const Text('Get Weather',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 18),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: NetworkImage(
                              'https://openweathermap.org/img/wn/$tempIcon@2x.png'),
                          width: 50,
                        ),
                        Flexible( child: Text("$condition",
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Spartan MB',
                              fontSize: 40.0,
                            )),)
                      ]),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: NetworkImage(
                              'https://flagcdn.com/h240/$cn.png'.toLowerCase()),
                          width: 50,
                        ),
                        Expanded(child: Text(" $city, $country",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Spartan MB',
                              fontSize: 34.0,
                            ))),
                      ]),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Temperature ${weatherModel.getWeatherIcon(temperature)}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Spartan MB',
                              fontSize: 33.0,
                            )),
                        Text(" $temperature°",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Spartan MB',
                              fontSize: 34.0,
                            ))
                      ]),
                  SizedBox(height: 10),
                  IconButton(
                      icon: Icon(
                        Icons.arrow_circle_right,
                        size: 40,
                        color: Colors.brown,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageTwo(data: AllData)));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

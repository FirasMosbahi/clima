import 'package:clima/screens/climat_screen.dart';
import 'package:clima/services/weather_service.dart';
import 'package:clima/utilities/animated_routing.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String city = "";
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('images/city_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.dstATop,
              ),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 40,
                  ),
                  child: TextField(
                    decoration: kInputStyle,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      city = value;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      WeatherInfo weatherInfo = await getCityWeather(city);
                      Navigator.of(context).push(
                        animatedRouting(
                          ClimatScreen(
                            weatherInfo: weatherInfo,
                          ),
                        ),
                      );
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("No city with this name"),
                          content: const Text("Please give a valid city name"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const Text("okay"),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Get weather",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:clima/utilities/animated_routing.dart';
import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../utilities/constants.dart';

class ClimatScreen extends StatelessWidget {
  final WeatherInfo weatherInfo;
  const ClimatScreen({Key? key, required this.weatherInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(
                'images/location_background.jpg',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.dstATop,
              ),
            ),
          ),
          constraints: const BoxConstraints.expand(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              animatedRouting(
                                const LoadingScreen(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.near_me,
                            color: Colors.white,
                          )),
                      FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              animatedRouting(
                                const CityScreen(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.location_city,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${weatherInfo.temp}°",
                        style: kWeatherTextStyle,
                      ),
                      Text(
                        weatherInfo.getWeatherIcon(),
                        style: kWeatherTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 52,
                      right: 12,
                    ),
                    child: Text(
                      "${weatherInfo.getMessage()} in ${weatherInfo.cityName}",
                      style: kCommentTextStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

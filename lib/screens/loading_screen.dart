import 'package:clima/screens/climat_screen.dart';
import 'package:flutter/material.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../utilities/animated_routing.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    initialisingLocation();
  }

  void initialisingLocation() async {
    Location location = await getCurrentLocation();
    WeatherInfo weatherInfo = await getLocalWeather(location);
    Navigator.of(context).push(
      animatedRouting(
        ClimatScreen(
          weatherInfo: weatherInfo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }
}

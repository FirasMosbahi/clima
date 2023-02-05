import 'package:cities/cities.dart';
import 'package:cities/model.dart';

Future<List<String>> cities() async{
  final cities = await cities_auto();
  final allCities = cities.all;
  List<String> citiesList = [];
  for(City c in allCities){
    citiesList.add(c.city);
  }
  return citiesList;
}
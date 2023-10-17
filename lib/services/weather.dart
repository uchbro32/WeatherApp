import 'package:weather_app/screens/location.dart';
import 'package:weather_app/services/networking.dart';
const apiKey = '6637aeaea6ead488f1d8eb62903de4c8';
class WeatherModel {
  double latitude = 0;
  double longitude = 0;
  Future getWeatherCity(String cityName) async{
    NetworkHelper newNetwork =
    NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
    return await newNetwork.getData();
  }
  Future getWeatherData() async{
    Location ob1 = Location();
    await ob1.getLocationLL();
    latitude = ob1.longitude;
    longitude = ob1.latitude;
    NetworkHelper newNetwork =
    NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    return await newNetwork.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

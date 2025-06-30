import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather/weather_model.dart';
import 'package:weather_app/data/universal_data.dart';
import 'package:weather_app/utils/constants/constants.dart';

class WeatherService {
  final Dio dio = Dio();

  Future<UniversalData> getCurrentWeather(String city) async {
    try {
      Response response = await dio
          .get('$baseUrl/current.json?q=$city&key=$apiKey')
          .timeout(Duration(seconds: 30));
      if (response.statusCode == 200) {
        return UniversalData(data: WeatherModel.fromJson(response.data));
      } else {
        return UniversalData(error: response.data['message']);
      }
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}

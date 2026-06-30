import 'package:dio/dio.dart';
import '../../core/constants/app_constants.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio _dio;

  WeatherService({Dio? dio}) : _dio = dio ?? Dio();

  Future<WeatherModel> getCurrentWeather(double latitude, double longitude) async {
    try {
      final response = await _dio.get(
        '${AppConstants.openWeatherBaseUrl}/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': AppConstants.openWeatherApiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await _dio.get(
        '${AppConstants.openWeatherBaseUrl}/weather',
        queryParameters: {
          'q': city,
          'appid': AppConstants.openWeatherApiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ForecastModel>> getForecast(double latitude, double longitude) async {
    try {
      final response = await _dio.get(
        '${AppConstants.openWeatherBaseUrl}/forecast',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': AppConstants.openWeatherApiKey,
          'units': 'metric',
        },
      );

      if (response.statusCode == 200) {
        final list = response.data['list'] as List;
        return list.map((e) => ForecastModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load forecast data');
      }
    } catch (e) {
      rethrow;
    }
  }
}

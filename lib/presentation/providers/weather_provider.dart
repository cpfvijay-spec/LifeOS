import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/models/weather_model.dart';
import '../../data/services/weather_service.dart';

final weatherServiceProvider = Provider((ref) => WeatherService());

final currentWeatherProvider = FutureProvider.autoDispose<WeatherModel>((ref) async {
  final weatherService = ref.watch(weatherServiceProvider);
  final position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
  );
  return weatherService.getCurrentWeather(position.latitude, position.longitude);
});

final weatherByCityProvider =
    FutureProvider.family.autoDispose<WeatherModel, String>((ref, city) async {
  final weatherService = ref.watch(weatherServiceProvider);
  return weatherService.getWeatherByCity(city);
});

final forecastProvider = FutureProvider.autoDispose<List<ForecastModel>>((ref) async {
  final weatherService = ref.watch(weatherServiceProvider);
  final position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
  );
  return weatherService.getForecast(position.latitude, position.longitude);
});

final selectedCityProvider = StateProvider<String>((ref) => '');

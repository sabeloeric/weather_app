import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class WeatherLocalDataSource {
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final String jsonFilePath; // Path to the JSON file containing fake weather data

  WeatherLocalDataSourceImpl(this.jsonFilePath);

  @override
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName) async {
    try {
      final jsonString = await _loadJsonData();
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      if (jsonMap.containsKey(cityName)) {
        final weatherData = jsonMap[cityName] as Map<String, dynamic>;
        final weather = Weather(
          temperature: weatherData['temperature'],
          humidity: weatherData['humidity'],
          description: weatherData['description'],
        );
        return Right(weather);
      } else {
        return Left(WeatherNotFoundFailure());
      }
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  Future<String> _loadJsonData() async {
    final jsonString = await rootBundle.loadString(jsonFilePath);
    return jsonString;
  }
}
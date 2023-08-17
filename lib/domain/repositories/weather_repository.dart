import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName);
}

import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failure, Weather>> call(String cityName) async {
    return await repository.getWeatherForCity(cityName);
  }
}

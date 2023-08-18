import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/data/datasources/local/local_weather_data_source.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, Weather>> getWeatherForCity(String cityName) async {
    return await localDataSource.getWeatherForCity(cityName);
  }
}

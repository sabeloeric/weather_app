import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/data/datasources/local/local_weather_data_source.dart';
import 'package:weather_app/domain/entities/weather.dart';

void main() {
  late WeatherLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = WeatherLocalDataSourceImpl('assets/data/fake_weather_data.json');
  });

  group('getWeatherForCity', () {
    test('should return weather data for an existing city', () async {
      final cityName = 'New York';
      final expectedWeather = Weather(
        temperature: 25.0,
        humidity: 60.0,
        description: 'Sunny',
      );

      final result = await dataSource.getWeatherForCity(cityName);

      expect(result, equals(Right<Failure, Weather>(expectedWeather)));
    });

    test('should return CacheFailure for a non-existing city', () async {
      final cityName = 'NonExistentCity';

      final result = await dataSource.getWeatherForCity(cityName);

      expect(result, equals(Left<Failure, Weather>(CacheFailure())));
    });
  });
}

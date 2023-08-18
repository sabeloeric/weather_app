import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/data/datasources/local/local_weather_data_source.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<WeatherLocalDataSourceImpl>()])
import 'weather_repository_impl_test.mocks.dart';

void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherLocalDataSourceImpl mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockWeatherLocalDataSourceImpl();
    repository = WeatherRepositoryImpl(mockLocalDataSource);
  });

  group('getWeatherForCity', () {
    final cityName = 'New York';
    final expectedWeather = Weather(
      temperature: 25.0,
      humidity: 60.0,
      description: 'Sunny',
    );

    test('should return weather data from local data source', () async {
      when(mockLocalDataSource.getWeatherForCity(cityName))
          .thenAnswer((_) async => Right(expectedWeather));

      final result = await repository.getWeatherForCity(cityName);

      expect(result, equals(Right(expectedWeather)));
      verify(mockLocalDataSource.getWeatherForCity(cityName));
    });


    test('should return CacheFailure if local data source fails', () async {
      final failure = CacheFailure();

      when(mockLocalDataSource.getWeatherForCity(cityName))
          .thenAnswer((_) async => Left(failure));

      final result = await repository.getWeatherForCity(cityName);

      expect(result, equals(Left(CacheFailure())));
      verify(mockLocalDataSource.getWeatherForCity(cityName));
    });
  });
}

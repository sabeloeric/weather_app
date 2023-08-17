import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_weather_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
import 'weather_repository_test.mocks.dart';

void main() {
  late WeatherRepository repository;
  late GetWeatherUseCase useCase;

  setUp(() {
    repository = MockWeatherRepository();
    useCase = GetWeatherUseCase(repository);
  });

  group('GetWeatherUseCase', () {
    test('Should get weather data from the repository', () async {
      final cityName = 'New York';
      final weatherData = Weather(
        temperature: 25.0,
        humidity: 60.0,
        description: 'Sunny',
      );
      when(repository.getWeatherForCity(cityName))
          .thenAnswer((_) async => Right(weatherData));

      final result = await useCase(cityName);

      expect(result, Right(weatherData));
      verify(repository.getWeatherForCity(cityName));
      verifyNoMoreInteractions(repository);
    });

    test('Should return a Failure when repository call fails', () async {
      final cityName = 'NonExistentCity';
      final failure = ServerFailure();
      when(repository.getWeatherForCity(cityName))
          .thenAnswer((_) async => Left(failure));

      final result = await useCase(cityName);

      expect(result, Left(failure));
      verify(repository.getWeatherForCity(cityName));
      verifyNoMoreInteractions(repository);
    });
  });
}

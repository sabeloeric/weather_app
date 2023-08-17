import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/entities/weather.dart';

void main() {
  group('Weather Entity', () {
    test('Should create a Weather instance', () {
      final weather = Weather(
        temperature: 25.0,
        humidity: 60.0,
        description: 'Sunny',
      );

      expect(weather.temperature, 25.0);
      expect(weather.humidity, 60.0);
      expect(weather.description, 'Sunny');
    });
  });
}

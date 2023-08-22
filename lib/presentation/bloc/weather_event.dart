part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherForCityEvent extends WeatherEvent {
  final String cityName;

  const GetWeatherForCityEvent({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

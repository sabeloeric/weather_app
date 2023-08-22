import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/usecases/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc({required this.getWeatherUseCase}) : super(WeatherInitial()) {
    on<GetWeatherForCityEvent>((event, emit) async {
      emit(WeatherLoading());

      final result = await getWeatherUseCase(event.cityName);

      result.fold(
        (failure) =>
            emit(WeatherError(errorMessage: _mapFailureToMessage(failure))),
        (weather) => emit(WeatherLoaded(weather: weather)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server error occurred';
    } else if (failure is CacheFailure) {
      return 'Cache error occurred';
    } else if (failure is WeatherNotFoundFailure) {
      return 'Weather not found';
    }
    return 'Unknown error';
  }
}

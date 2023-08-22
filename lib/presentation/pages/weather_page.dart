import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cityController = TextEditingController();
    final _bloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'Enter City Name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final cityName = _cityController.text;
                _bloc.add(GetWeatherForCityEvent(cityName: cityName));
              },
              child: const Text('Get Weather'),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      Text('Temperature: ${state.weather.temperature.toStringAsFixed(1)}°C'),
                      Text('Humidity: ${state.weather.humidity.toStringAsFixed(1)}%'),
                      Text('Description: ${state.weather.description}'),
                    ],
                  );
                } else if (state is WeatherError) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

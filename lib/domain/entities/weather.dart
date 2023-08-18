import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final double temperature;
  final double humidity;
  final String description;

  const Weather({
    required this.temperature,
    required this.humidity,
    required this.description,
  });

  @override
  List<Object?> get props => [temperature, humidity, description];
}

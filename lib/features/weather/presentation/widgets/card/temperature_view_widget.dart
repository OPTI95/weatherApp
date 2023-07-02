import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_cubit.dart';

class TemperatureViewWidget extends StatelessWidget {
  const TemperatureViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Text(
            "${state.weatherEntity.main.temp.round()}°",
            style: const TextStyle(
                fontSize: 74, fontWeight: FontWeight.w500, color: Colors.white),
          );
        } else if (state is WeatherInitialState) {
          context.read<WeatherCubit>().fetchWeatherCity("Podolsk");
          return const RefreshProgressIndicator();
        } else {
          return const RefreshProgressIndicator();
        }
      },
    );
  }
}
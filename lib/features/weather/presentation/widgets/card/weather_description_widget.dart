import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_cubit.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  const WeatherDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Text(
            state.weatherEntity.weather!.main,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

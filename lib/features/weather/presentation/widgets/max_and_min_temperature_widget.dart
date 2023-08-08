import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/text_style/custom_text_style.dart';
import '../cubit/weather_cubit.dart';

class MaxMinTemperatureWidget extends StatelessWidget {
  const MaxMinTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final String max = state.weatherEntity.main.temp_max.round().toString();
          final String min = state.weatherEntity.main.temp_min.round().toString();
          return Text(
            "Макс.: ${max}° Мин: ${min}°",
            style: CustomTextStyle.B1(context).copyWith(color: Colors.white),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

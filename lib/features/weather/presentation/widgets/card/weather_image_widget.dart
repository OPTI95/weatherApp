import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_cubit.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          String imgName = state.weatherEntity.weather!.icon.toString();
          return Image.network(
              "https://openweathermap.org/img/wn/$imgName@4x.png");
        } else {
          return Container();
        }
      },
    );
  }
}
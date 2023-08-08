import 'package:book/helpers/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';

class TemperatureViewWidget extends StatelessWidget {
  const TemperatureViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Text("${state.weatherEntity?.main.temp.round()}°",
              style: CustomTextStyle.H1(context).copyWith(
                  fontSize: 64,
                  color: Colors.white,
                  fontWeight: FontWeight.w500));
        } else if (state is WeatherInitialState) {
          return const RefreshProgressIndicator();
        } else {
          return const RefreshProgressIndicator();
        }
      },
    );
  }
}

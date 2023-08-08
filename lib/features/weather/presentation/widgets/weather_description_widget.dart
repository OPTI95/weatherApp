import 'package:book/helpers/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';

class WeatherDescriptionWidget extends StatelessWidget {
  const WeatherDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final String description = state.weatherEntity!.weather!.description;
          return Text(
            description[0].toUpperCase() + description.substring(1),
            style: CustomTextStyle.B1(context).copyWith(color: Colors.white),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

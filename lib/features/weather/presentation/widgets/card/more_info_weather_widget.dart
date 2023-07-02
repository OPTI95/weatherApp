import 'package:book/features/weather/presentation/widgets/card/weather_info_in_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_cubit.dart';

class MoreInfoWeatherWidget extends StatelessWidget {
  const MoreInfoWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3, crossAxisCount: 2),
              children: [
                WeatherInfoInCardWidget(
                  valueName:
                      "${state.weatherEntity.wind.speed} km/h",
                  descriptionName: "Wind",
                  iconName: "wind.png",
                ),
                WeatherInfoInCardWidget(
                  valueName: "${state.weatherEntity.all}%",
                  descriptionName: "Clouds",
                  iconName: "cloud.png",
                ),
                WeatherInfoInCardWidget(
                  valueName: "${state.weatherEntity.main.humidity}%",
                  descriptionName: "Humidity",
                  iconName: "humidity.png",
                ),
                WeatherInfoInCardWidget(
                  valueName:
                      "${state.weatherEntity.main.pressure} mbar",
                  descriptionName: "Pressure",
                  iconName: "pressure.png",
                )
              ]);
        } else {
          return Container();
        }
      },
    );
  }
}
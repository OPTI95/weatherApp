import 'package:book/features/weather/presentation/widgets/card/weather_info_in_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/deg_wind/get_wind_direction.dart';
import '../../../../helpers/relative_humidity/classification_humidity.dart';
import '../cubit/weather_cubit.dart';

class MoreInfoWeatherWidget extends StatelessWidget {
  const MoreInfoWeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Card(
            color: const Color.fromRGBO(255, 255, 255, 0.2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: WeatherInfoInCardWidget(
                    valueName: "${state.weatherEntity?.wind.speed} м/с",
                    descriptionName:
                        "Ветер ${GetWindDirection.getWindDirection(state.weatherEntity!.wind.deg).toLowerCase()}",
                    iconName: "wind.png",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                  child: WeatherInfoInCardWidget(
                    valueName: "${state.weatherEntity?.main.humidity}%",
                    descriptionName: ClassifyHumidity.classifyHumidity(
                        state.weatherEntity!.main.humidity.toDouble()),
                    iconName: "drop.png",
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

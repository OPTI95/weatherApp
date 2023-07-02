import 'package:book/features/weather/presentation/widgets/card/temperature_view_widget.dart';
import 'package:book/features/weather/presentation/widgets/card/today_widget.dart';
import 'package:book/features/weather/presentation/widgets/card/weather_description_widget.dart';
import 'package:book/features/weather/presentation/widgets/card/weather_image_widget.dart';
import 'package:flutter/material.dart';

import 'more_info_weather_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: RadialGradient(
          radius: 0.7,
          center: Alignment.topCenter,
          colors: [
            Colors.lightBlueAccent,
            Colors.blue,
          ],
        ),
      ),
      child: const Column(
        children: [
          WeatherImageWidget(),
          TodayWidget(),
          TemperatureViewWidget(),
          WeatherDescriptionWidget(),
          Divider(
            thickness: 2,
            endIndent: 25,
            indent: 25,
          ),
          MoreInfoWeatherWidget()
        ],
      ),
    );
  }
}

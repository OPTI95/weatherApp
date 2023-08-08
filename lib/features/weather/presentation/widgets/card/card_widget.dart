import 'package:book/features/weather/presentation/widgets/card/next_time_weather_info_card_widget.dart';
import 'package:flutter/material.dart';

import '../max_and_min_temperature_widget.dart';
import '../more_info_weather_widget.dart';
import '../temperature_view_widget.dart';
import '../weather_description_widget.dart';
import '../weather_image_widget.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WeatherImageWidget(),
        //TodayWidget(),
        TemperatureViewWidget(),
        WeatherDescriptionWidget(),
        SizedBox(height: 8,),
        MaxMinTemperatureWidget(),
        SizedBox(height: 24,),
        NextTimeInfoWeatherCardWidget(),
        MoreInfoWeatherWidget()
      ],
    );
  }
}

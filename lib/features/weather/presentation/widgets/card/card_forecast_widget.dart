import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../helpers/text_style/custom_text_style.dart';
import '../../cubit/weather_cubit.dart';

class CardForecastWeather extends StatelessWidget {
  final int index;
  const CardForecastWeather({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<WeatherCubit>().state as WeatherLoadedState;

    DateTime dateTime =
        DateTime.parse(state.weatherForecastEntity![index].dt_txt);

    String timeFormatted =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    return SizedBox(
      width: 80,
      child: Card(
          elevation: 0,
          color: index == 0 ? Colors.white38 : Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: index == 0
                  ? BorderSide(color: Colors.white, width: 1)
                  : BorderSide.none),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  timeFormatted,
                  style:
                      CustomTextStyle.B2(context).copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "images/${getIconName(state.weatherForecastEntity[index].weather!.id, dateTime)}.png",
                  width: 32,
                  height: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  state.weatherForecastEntity![index].temp.toInt().toString() +
                      "°",
                  style: CustomTextStyle.B1(context).copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )),
    );
  }

  String getIconName(int id, DateTime dateTime) {
    String idIcon = id.toString();
    print(idIcon);
    if (idIcon[0] == "2") {
      return "CloudLightning";
    } else if (idIcon[0] == "3") {
      return "CloudRain";
    } else if (idIcon[0] == "5") {
      return "CloudRain";
    } else if (idIcon[0] == "6") {
      return "CloudSnow";
    } else if (idIcon == "800") {
      return "Sun2";
    } else if ((idIcon[0] == "7" || idIcon[0] == "8") &&
        (dateTime.hour >= 0 && dateTime.hour < 4)) {
      return "CloudMoon";
    } else if (idIcon[0] == "7" || idIcon[0] == "8") {
      return "CloudSun";
    } else {
      return "";
    }
  }
}

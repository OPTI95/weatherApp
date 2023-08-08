import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          String img = getIconName(state.weatherEntity!.weather!.id);
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFBD87FF),
                      blurRadius: 90,
                    )
                  ],
                ),
                child: Image.asset(
                  "images/$img.png",
                  scale: 4,
                  width: 170,
                  height: 170,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  String getIconName(int id) {
    String idIcon = id.toString();
    if (idIcon[0] == "2") {
      return "groza";
    } else if (idIcon[0] == "3") {
      return "rain2";
    } else if (idIcon[0] == "5") {
      return "rain";
    } else if (idIcon[0] == "6") {
      return "snow";
    } else if (idIcon[0] == "7" || idIcon[0] == "8") {
      return "sun";
    } else {
      return "";
    }
  }
}

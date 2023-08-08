import 'package:book/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:book/helpers/text_style/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'card_forecast_widget.dart';

class NextTimeInfoWeatherCardWidget extends StatefulWidget {
  const NextTimeInfoWeatherCardWidget({super.key});

  @override
  State<NextTimeInfoWeatherCardWidget> createState() =>
      _NextTimeInfoWeatherCardWidgetState();
}

class _NextTimeInfoWeatherCardWidgetState
    extends State<NextTimeInfoWeatherCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color.fromRGBO(255, 255, 255, 0.2),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  "Сегодня",
                  style: CustomTextStyle.B1(context).copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  DateTime.now().day.toString() +
                      " " '${DateFormat('MMMM', 'ru_RU').format(DateTime.now())[0].toUpperCase()}${DateFormat('MMMM', 'ru_RU').format(DateTime.now()).substring(1)}',
                  style:
                      CustomTextStyle.B2(context).copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 177,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoadedState) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.weatherForecastEntity.length,
                        itemBuilder: (context, index) {
                          return CardForecastWeather(
                            index: index,
                          );
                        });
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


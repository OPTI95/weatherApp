import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather_cubit.dart';

class SliverAppBarWidget extends StatefulWidget {
  SliverAppBarWidget({
    super.key,
  });
  bool isSearch = false;

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(actions: [
      !widget.isSearch
          ? const TextInAppBarWidget()
          : Expanded(child: TextField(
              onSubmitted: (value) async {
                await fetchWeather(context, value);
              },
            )),
      IconButton(
          onPressed: () {
            widget.isSearch = !widget.isSearch;
            setState(() {});
          },
          icon: const Icon(Icons.location_on_sharp))
    ]);
  }

  fetchWeather(BuildContext context, String value) async {
    await context.read<WeatherCubit>().fetchWeatherCity(value.toString());
  }
}

class TextInAppBarWidget extends StatelessWidget {
  const TextInAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    state.weatherEntity.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

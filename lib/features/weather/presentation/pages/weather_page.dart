import 'package:book/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/sliver_app_bar_widget.dart';
import '../widgets/sliver_card_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Color.fromRGBO(7, 0, 255, 1), Colors.black],
              focal: AlignmentGeometry.lerp(
                  Alignment.center, Alignment.topCenter, 0.54),
              radius: 1.6,
              tileMode: TileMode.decal),
        ),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              context.read<WeatherCubit>().fetchWeatherCity();
              return Center(
                child: RefreshProgressIndicator(),
              );
            } else if (state is WeatherLoadedState) {
              return CustomScrollView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                slivers: [
                  SliverAppBarWidget(),
                  const SliverCardWidget(),
                ],
              );
            } else {
              return Center(
                child: RefreshProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

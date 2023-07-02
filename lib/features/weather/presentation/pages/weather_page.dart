import 'package:flutter/material.dart';
import '../widgets/card/sliver_card_widget.dart';
import '../widgets/sliver_app_bar_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(),
          const SliverCardWidget(),
        ],
      ),
    );
  }
}
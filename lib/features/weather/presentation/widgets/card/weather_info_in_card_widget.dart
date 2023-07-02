import 'package:flutter/material.dart';

class WeatherInfoInCardWidget extends StatelessWidget {
  final String iconName;
  final String valueName;
  final String descriptionName;
  const WeatherInfoInCardWidget({
    super.key,
    required this.iconName,
    required this.valueName,
    required this.descriptionName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(AssetImage("images/" + iconName)),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              valueName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              descriptionName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
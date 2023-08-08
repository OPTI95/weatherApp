import 'package:book/helpers/text_style/custom_text_style.dart';
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
      children: [
        ImageIcon(
          AssetImage("images/" + iconName),
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 70,
          child: Text(
            valueName,
            style: CustomTextStyle.B2(context).copyWith(
                color: Color.fromRGBO(255, 255, 255, 0.20),
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          descriptionName,
          style: CustomTextStyle.B2(context).copyWith(color: Colors.white),
        ),
        Spacer()
      ],
    );
  }
}

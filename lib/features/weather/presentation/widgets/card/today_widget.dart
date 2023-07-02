import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${DateFormat('EEEE').format(
                DateTime.now(),
              )} ",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Container(
          width: 3,
          height: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
        ),
        Text(
          " ${DateFormat('MMM').format(
                DateTime.now(),
              )} ",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          "${DateTime.now().day} ",
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ],
    );
  }
}
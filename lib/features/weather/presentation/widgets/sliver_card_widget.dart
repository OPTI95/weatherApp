
import 'package:flutter/material.dart';

import 'card/card_widget.dart';

class SliverCardWidget extends StatelessWidget {
  const SliverCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const CardWidget(),
        ),
      ),
    );
  }
}
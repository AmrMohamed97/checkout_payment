import 'package:checkout_app/core/styles.dart';
import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style24,
        ),
      ],
    );
  }
}

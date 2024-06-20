import 'package:checkout_app/core/utiles/styles.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.styleRegular18,
        ),
        Text(
          value,
          style: Styles.stylesemiBold18,
        ),
      ],
    );
  }
}

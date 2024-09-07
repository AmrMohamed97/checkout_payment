import 'package:checkout_app/checkout/presentation/view/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutPayment());
}

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

//  PaymentIntentObject createPaymentIntent(amount,currency){}
//  initPaymentSheet(paymentIntentClientSecret){}
//  presentPaymentSheet()
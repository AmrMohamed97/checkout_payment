import 'package:checkout_app/checkout/presentation/view/my_cart_view.dart';
import 'package:checkout_app/core/keys.dart';
import 'package:checkout_app/core/utils/my_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey=Keys.lPublishableKey;
  Bloc.observer = MyObserver();
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
import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_app/core/keys.dart';
import 'package:checkout_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiServices apiServices = ApiServices();
  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    Response response = await apiServices.post(
      url: Keys.lCreatePaymentIntent,
      body: paymentIntentInput.toJson(),
      token: Keys.lSecretKey,
    );
    PaymentIntentModel paymentIntentInputModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentInputModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Amr",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    PaymentIntentModel paymentIntent =
        await createPaymentIntent(paymentIntentInput: paymentIntentInput);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntent.clientSecret!,
    );
    await displayPaymentSheet();
  }
}

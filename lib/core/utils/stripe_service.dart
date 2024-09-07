import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_app/core/keys.dart';
import 'package:checkout_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
 
class StripeService {
  ApiServices apiServices = ApiServices();
  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    Response response = await apiServices.post(
      url: "https://api.stripe.com/v1/payment_intents",
      body: paymentIntentInput.toJson(),
      token:Keys.secretKey,
    );
    PaymentIntentModel paymentIntentInputModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentInputModel;
  }
}

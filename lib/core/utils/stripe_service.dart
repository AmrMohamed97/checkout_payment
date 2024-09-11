import 'package:checkout_app/checkout/data/models/customer_model/customer_model.dart';
import 'package:checkout_app/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_app/core/keys.dart';
import 'package:checkout_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiServices apiServices = ApiServices();
  Future<CustomerModel> createCustomer({required String name}) async {
    Response response = await apiServices.post(
      url: Keys.lCreateCustomerUrl,
      body: {
        "name": name,
      },
      token: Keys.lSecretKey,
    );
    print(response.data["id"]);
    CustomerModel customerModel = CustomerModel.fromJson(response.data);
    print(customerModel.id);
    return customerModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    Response response = await apiServices.post(
      url: Keys.lCreateEphemeralKey,
      body: {"customer": customerId},
      stripeVersion: "2024-06-20",
      token: Keys.lSecretKey,
    );
    EphemeralKeyModel ephemeralKeyModel =
        EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

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

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerId,
    required String ephemeralKey,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Amr",
        customerId: customerId,
        customerEphemeralKeySecret: ephemeralKey,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInput,
  }) async {
    PaymentIntentModel paymentIntent =
        await createPaymentIntent(paymentIntentInput: paymentIntentInput);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntent.clientSecret!,
      customerId: paymentIntentInput.customer,
      ephemeralKey: paymentIntentInput.ephemeralKey,
    );
    await displayPaymentSheet();
  }
}

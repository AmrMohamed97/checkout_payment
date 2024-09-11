import 'package:checkout_app/checkout/data/models/customer_model/customer_model.dart';
import 'package:checkout_app/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, CustomerModel>> createCustomer({required String name});
  Future<Either<Failure, EphemeralKeyModel>> createEphemeralKey({required String customerId});
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInput});
}

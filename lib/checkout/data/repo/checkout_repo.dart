import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInput});
}

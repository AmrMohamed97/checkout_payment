import 'package:checkout_app/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_app/checkout/data/repo/checkout_repo.dart';
import 'package:checkout_app/core/error/failure.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    try {
      await stripeService.makePayment(
        paymentIntentInput: paymentIntentInput,
      );
      return right(null);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}

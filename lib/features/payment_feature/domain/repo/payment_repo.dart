import 'package:dartz/dartz.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/create_customer_model/create_customer_model.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/ephemeral_keys_model/ephemeral_keys_Model.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/intent_input_model/intent_input_model.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/intent_output_model/intent_output_model.dart';

import '../../../../app/error/failures.dart';

abstract  class PaymentRepo{
  Future<Either<Failure, IntentOutputModel>>createPaymentIntent(Map <String,dynamic > map );
  Future<Either<Failure, CreateCustomerModel>>createCustomer(Map <String,dynamic > map );
  Future<Either<Failure, EphemeralKeysModel>>getEphemeralKey(Map <String,dynamic > map );
}
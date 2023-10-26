import 'package:dartz/dartz.dart';
import 'package:pay_app/app/error/failures.dart';
import 'package:pay_app/app/usecase/usecase.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/ephemeral_keys_model/ephemeral_keys_Model.dart';
import 'package:pay_app/features/payment_feature/domain/repo/payment_repo.dart';

class EphemeralKeyUseCase implements UseCase<EphemeralKeysModel , EphemeralKeyUseCaseParams>{
  final PaymentRepo paymentRepo ;

  EphemeralKeyUseCase({required this.paymentRepo});
  @override
  Future<Either<Failure, EphemeralKeysModel>> call(params) async {
    return await paymentRepo.getEphemeralKey(params.toMap());
  }

}

class EphemeralKeyUseCaseParams{
  final String customerId;

  EphemeralKeyUseCaseParams(
      {
        required this.customerId,
      });

  Map<String, dynamic> toMap() {
    final map = {
      "customer" : customerId,
    };
    return map;
  }
}
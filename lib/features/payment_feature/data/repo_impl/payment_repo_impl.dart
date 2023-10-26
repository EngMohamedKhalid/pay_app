import 'package:dartz/dartz.dart';

import 'package:pay_app/app/error/failures.dart';
import 'package:pay_app/features/payment_feature/data/data_sources/payment_remote_data_source.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/create_customer_model/create_customer_model.dart';
import 'package:pay_app/features/payment_feature/data/models/stripe_models/ephemeral_keys_model/ephemeral_keys_Model.dart';

import 'package:pay_app/features/payment_feature/data/models/stripe_models/intent_input_model/intent_input_model.dart';

import 'package:pay_app/features/payment_feature/data/models/stripe_models/intent_output_model/intent_output_model.dart';

import '../../../../app/network/network_info.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo{
  final NetworkInfo networkInfo;
  final PaymentRemoteDataSource paymentRemoteDataSource;

  PaymentRepoImpl({required this.networkInfo,required  this.paymentRemoteDataSource});
  @override
  Future<Either<Failure, IntentOutputModel>> createPaymentIntent(Map <String,dynamic > map ) async{
    return await RepoImplCallHandler<IntentOutputModel>(networkInfo)(() async {
      var res =  await paymentRemoteDataSource.post(
          body: map,
        contentType: 'application/x-www-form-urlencoded'
      );
      IntentOutputModel intentOutputModel = IntentOutputModel.fromJson(res.data);
      return intentOutputModel;
    });
  }

  @override
  Future<Either<Failure, CreateCustomerModel>> createCustomer(Map<String, dynamic> map)async {
    return await RepoImplCallHandler<CreateCustomerModel>(networkInfo)(() async {
      var res =  await paymentRemoteDataSource.createCustomer(
          body: map,
          contentType: 'application/x-www-form-urlencoded'
      );
      CreateCustomerModel createCustomerModel = CreateCustomerModel.fromJson(res.data);
      return createCustomerModel;
    });
  }

  @override
  Future<Either<Failure, EphemeralKeysModel>> getEphemeralKey(Map<String, dynamic> map)async {
    return await RepoImplCallHandler<EphemeralKeysModel>(networkInfo)(() async {
      var res =  await paymentRemoteDataSource.getEphemeralKey(
          body: map,
          contentType: 'application/x-www-form-urlencoded'
      );
      EphemeralKeysModel ephemeralKeysModel = EphemeralKeysModel.fromJson(res.data);
      return ephemeralKeysModel;
    });
  }
  
}
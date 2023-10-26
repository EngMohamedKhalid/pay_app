import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pay_app/app/utils/consts.dart';

abstract class PaymentRemoteDataSource{
  Future <Response> post({required body , String ? contentType});
  Future <Response> createCustomer({required body , String ? contentType});
  Future <Response> getEphemeralKey({required body ,String ? contentType});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource{
  final Dio dio = Dio();
  @override
  Future<Response> post({required body,String? contentType}) async {
    var res = await dio.post(
      "https://api.stripe.com/v1/payment_intents",
      data: body,
      options: Options(
        contentType: contentType??"application/x-www-form-urlencoded",
        headers: {
          "Authorization" : "Bearer $kSecretKey"
        }
      )
    );
   return res;
  }

  @override
  Future<Response> createCustomer({required body, String? contentType})async {
    var res = await dio.post(
        "https://api.stripe.com/v1/customers",
        data: body,
        options: Options(
            contentType: contentType??"application/x-www-form-urlencoded",
            headers: {
              "Authorization" : "Bearer $kSecretKey"
            }
        )
    );
    return res;
  }

  @override
  Future<Response> getEphemeralKey({required body, String? contentType}) async {
    var res = await dio.post(
        "https://api.stripe.com/v1/ephemeral_keys",
        data: body,
        options: Options(
            contentType: contentType??"application/x-www-form-urlencoded",
            headers: {
              "Authorization" : "Bearer $kSecretKey",
              "Stripe-Version":"2023-10-16",
            }
        )
    );
    return res;
  }

}



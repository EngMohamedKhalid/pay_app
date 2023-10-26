class IntentInputModel {
  final String amount ;
  final String currency ;

  IntentInputModel({required this.amount, required this.currency});

  toJson(){
    return {
      "amount" : amount,
      "currency" : currency,
    };
  }
}
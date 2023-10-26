

import '../../user_model.dart';

abstract class Failure {
  String? cause;
  Failure([this.cause]);

}

// General failures
class ServerFailure extends Failure {
  @override
  String? cause;
  ServerFailure(this.cause) : super(cause);
}

class AmbiguousFailure extends Failure {
  @override
  String? cause;
  AmbiguousFailure(this.cause) : super(cause);
}

class ConnectionFailure extends Failure {
  @override
  String? cause;
  ConnectionFailure(this.cause) : super(cause);
}

class DataParsingFailure extends Failure {
  @override
  String? cause;
  DataParsingFailure(this.cause) : super(cause);
}

class AuthFailure extends Failure {
  @override
  String? cause;
  UserModel?  user;
  AuthFailure(this.cause,this.user) : super(cause);
}

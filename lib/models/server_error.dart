import 'package:akasztofa/models/error_types.dart';

class ServerError {
  final String message;
  final ErrorTypes errorType;

  ServerError(this.message, this.errorType);

  static fromJson(json) {}
}

class AppException implements Exception{
  final _message;
  final _prefitx;
  AppException([this._message,this._prefitx]);

  @override
  String toString() {
    return '$_prefitx$_message';
    return super.toString();
  }

}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message, "Error During Communication ");
}

class BadRequestException extends AppException{
  BadRequestException([String? message, String? prefix]) : super(message,'Invalid request');
}

class UnauthorisedException extends AppException{
  UnauthorisedException([String? message, String? prefix]) : super(message,'Unauthorised request');
}
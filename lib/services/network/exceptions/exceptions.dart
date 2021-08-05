class CacheException implements Exception {}

class ApiException implements Exception {
  final String? errorMessage;

  ApiException({required this.errorMessage});
}

class BadNetworkException implements Exception {}

class InternalServerException implements Exception {}

class UnauthenticatedException implements Exception {}

class ApiErrorMessageException implements Exception {
  final String errorMessage;

  ApiErrorMessageException({required this.errorMessage});
}

class UnauthorisedRequestException implements Exception {}

class RequestCancelledException implements Exception {}

class RequestTimeoutException implements Exception {}

class SendTimeoutException implements Exception {}

class NotFoundException implements Exception {}

class ConflictException implements Exception {}

class InternalServerErrorException implements Exception {}

class ServiceUnavailableException implements Exception {}

class FormatException implements Exception {}

class UnexpectedError implements Exception {}

class UnableToProcess implements Exception {}

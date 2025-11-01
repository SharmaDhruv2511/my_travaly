enum ApiStatus { success, error, noInternet, invalidToken, loading }

class ApiResponse {
  ApiResponse({required this.apiStatus, required this.errorMessage, this.json});

  ApiStatus apiStatus;
  String errorMessage;
  dynamic json;
}
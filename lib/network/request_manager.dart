import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_travaly_task/network/api_reponse.dart';

class RequestManager {
  static const String _baseURL = "https://api.mytravaly.com/public/v1/";

  static Future<ApiResponse> postRequest({
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    
    // ✅ 1️⃣ Check Internet
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      return ApiResponse(
        apiStatus: ApiStatus.noInternet,
        errorMessage: "No Internet Connection",
      );
    }

    final url = _baseURL;

    printMessage(" POST URL: $url");
    printMessage(" Request Body: $body");
    printMessage(" Headers: $headers");

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
          ...?headers,
        },
      );

      printMessage(" Status Code: ${response.statusCode}");
      printMessage(" Response Body: ${response.body}");

      final jsonResponse = response.body.isNotEmpty
          ? jsonDecode(response.body)
          : null;

      if (response.statusCode == 401) {
        return ApiResponse(
          apiStatus: ApiStatus.invalidToken,
          errorMessage: "Authentication Failed",
          json: jsonResponse,
        );
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse(
          apiStatus: ApiStatus.success,
          errorMessage: "",
          json: jsonResponse,
        );
      } else {
        return ApiResponse(
          apiStatus: ApiStatus.error,
          errorMessage: jsonResponse?["message"] ?? "Request Failed",
          json: jsonResponse,
        );
      }

    } catch (e, stack) {
      log("❌ Exception: $e");
      log("📍 Stack: $stack");

      return ApiResponse(
        apiStatus: ApiStatus.error,
        errorMessage: "Something went wrong",
      );
    }
  }
}

void printMessage(dynamic message) {
  if (kDebugMode) print(message);
}




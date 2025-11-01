import 'package:my_travaly_task/models/search_auto_complete_model.dart';
import 'package:my_travaly_task/network/api_reponse.dart';
import 'package:my_travaly_task/network/request_manager.dart';

class SearchRepository {
  Future<ApiResponse> searchAutoComplete(String inputText) async {
    final body = {
      "action": "searchAutoComplete",
      "searchAutoComplete": {
        "inputText": inputText,
        "searchType": [
          "byCity",
          "byState",
          "byCountry",
          "byRandom",
          "byPropertyName",
        ],
        "limit": 10,
      },
    };

    final response = await RequestManager.postRequest(
      body: body,
      headers: {
        "authtoken": "71523fdd8d26f585315b4233e39d9263",
        "visitortoken": "09c0-ee1d-8408-fd79-70da-cc58-7c49-12f9",
      },
    );

    if (response.apiStatus == ApiStatus.success && response.json != null) {
      try {
        final parsedData = SearchAutoComplete.fromJson(response.json);
        return ApiResponse(
          apiStatus: ApiStatus.success,
          errorMessage: "",
          json: parsedData,
        );
      } catch (_) {
        return ApiResponse(
          apiStatus: ApiStatus.error,
          errorMessage: "Data Parsing Failed",
        );
      }
    }

    return response;
  }
}

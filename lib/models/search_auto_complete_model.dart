// To parse this JSON data, do
//
//     final searchAutoComplete = searchAutoCompleteFromJson(jsonString);

import 'dart:convert';

SearchAutoComplete searchAutoCompleteFromJson(String str) => SearchAutoComplete.fromJson(json.decode(str));

String searchAutoCompleteToJson(SearchAutoComplete data) => json.encode(data.toJson());

class SearchAutoComplete {
    bool status;
    String message;
    int responseCode;
    Data data;

    SearchAutoComplete({
        required this.status,
        required this.message,
        required this.responseCode,
        required this.data,
    });

    SearchAutoComplete copyWith({
        bool? status,
        String? message,
        int? responseCode,
        Data? data,
    }) => 
        SearchAutoComplete(
            status: status ?? this.status,
            message: message ?? this.message,
            responseCode: responseCode ?? this.responseCode,
            data: data ?? this.data,
        );

    factory SearchAutoComplete.fromJson(Map<String, dynamic> json) => SearchAutoComplete(
        status: json["status"],
        message: json["message"],
        responseCode: json["responseCode"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responseCode": responseCode,
        "data": data.toJson(),
    };
}

class Data {
    bool present;
    int totalNumberOfResult;
    AutoCompleteList autoCompleteList;

    Data({
        required this.present,
        required this.totalNumberOfResult,
        required this.autoCompleteList,
    });

    Data copyWith({
        bool? present,
        int? totalNumberOfResult,
        AutoCompleteList? autoCompleteList,
    }) => 
        Data(
            present: present ?? this.present,
            totalNumberOfResult: totalNumberOfResult ?? this.totalNumberOfResult,
            autoCompleteList: autoCompleteList ?? this.autoCompleteList,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        present: json["present"],
        totalNumberOfResult: json["totalNumberOfResult"],
        autoCompleteList: AutoCompleteList.fromJson(json["autoCompleteList"]),
    );

    Map<String, dynamic> toJson() => {
        "present": present,
        "totalNumberOfResult": totalNumberOfResult,
        "autoCompleteList": autoCompleteList.toJson(),
    };
}

class AutoCompleteList {
    ByPropertyName byPropertyName;
    By byStreet;
    By byCity;
    By byState;
    ByCountry byCountry;

    AutoCompleteList({
        required this.byPropertyName,
        required this.byStreet,
        required this.byCity,
        required this.byState,
        required this.byCountry,
    });

    AutoCompleteList copyWith({
        ByPropertyName? byPropertyName,
        By? byStreet,
        By? byCity,
        By? byState,
        ByCountry? byCountry,
    }) => 
        AutoCompleteList(
            byPropertyName: byPropertyName ?? this.byPropertyName,
            byStreet: byStreet ?? this.byStreet,
            byCity: byCity ?? this.byCity,
            byState: byState ?? this.byState,
            byCountry: byCountry ?? this.byCountry,
        );

    factory AutoCompleteList.fromJson(Map<String, dynamic> json) => AutoCompleteList(
        byPropertyName: ByPropertyName.fromJson(json["byPropertyName"]),
        byStreet: By.fromJson(json["byStreet"]),
        byCity: By.fromJson(json["byCity"]),
        byState: By.fromJson(json["byState"]),
        byCountry: ByCountry.fromJson(json["byCountry"]),
    );

    Map<String, dynamic> toJson() => {
        "byPropertyName": byPropertyName.toJson(),
        "byStreet": byStreet.toJson(),
        "byCity": byCity.toJson(),
        "byState": byState.toJson(),
        "byCountry": byCountry.toJson(),
    };
}

class By {
    bool present;
    List<ByCityListOfResult> listOfResult;
    int numberOfResult;

    By({
        required this.present,
        required this.listOfResult,
        required this.numberOfResult,
    });

    By copyWith({
        bool? present,
        List<ByCityListOfResult>? listOfResult,
        int? numberOfResult,
    }) => 
        By(
            present: present ?? this.present,
            listOfResult: listOfResult ?? this.listOfResult,
            numberOfResult: numberOfResult ?? this.numberOfResult,
        );

    factory By.fromJson(Map<String, dynamic> json) => By(
        present: json["present"],
        listOfResult: List<ByCityListOfResult>.from(json["listOfResult"].map((x) => ByCityListOfResult.fromJson(x))),
        numberOfResult: json["numberOfResult"],
    );

    Map<String, dynamic> toJson() => {
        "present": present,
        "listOfResult": List<dynamic>.from(listOfResult.map((x) => x.toJson())),
        "numberOfResult": numberOfResult,
    };
}

class ByCityListOfResult {
    String valueToDisplay;
    PurpleAddress address;
    SearchArray searchArray;

    ByCityListOfResult({
        required this.valueToDisplay,
        required this.address,
        required this.searchArray,
    });

    ByCityListOfResult copyWith({
        String? valueToDisplay,
        PurpleAddress? address,
        SearchArray? searchArray,
    }) => 
        ByCityListOfResult(
            valueToDisplay: valueToDisplay ?? this.valueToDisplay,
            address: address ?? this.address,
            searchArray: searchArray ?? this.searchArray,
        );

    factory ByCityListOfResult.fromJson(Map<String, dynamic> json) => ByCityListOfResult(
        valueToDisplay: json["valueToDisplay"],
        address: PurpleAddress.fromJson(json["address"]),
        searchArray: SearchArray.fromJson(json["searchArray"]),
    );

    Map<String, dynamic> toJson() => {
        "valueToDisplay": valueToDisplay,
        "address": address.toJson(),
        "searchArray": searchArray.toJson(),
    };
}

class PurpleAddress {
    String city;
    String state;
    String country;
    String? street;

    PurpleAddress({
        required this.city,
        required this.state,
        required this.country,
        this.street,
    });

    PurpleAddress copyWith({
        String? city,
        String? state,
        String? country,
        String? street,
    }) => 
        PurpleAddress(
            city: city ?? this.city,
            state: state ?? this.state,
            country: country ?? this.country,
            street: street ?? this.street,
        );

    factory PurpleAddress.fromJson(Map<String, dynamic> json) => PurpleAddress(
        city: json["city"],
        state: json["state"],
        country: json["country"],
        street: json["street"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "country": country,
        "street": street,
    };
}

class SearchArray {
    String type;
    List<String> query;

    SearchArray({
        required this.type,
        required this.query,
    });

    SearchArray copyWith({
        String? type,
        List<String>? query,
    }) => 
        SearchArray(
            type: type ?? this.type,
            query: query ?? this.query,
        );

    factory SearchArray.fromJson(Map<String, dynamic> json) => SearchArray(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
    };
}

class ByCountry {
    bool present;
    List<ByCountryListOfResult> listOfResult;
    int numberOfResult;

    ByCountry({
        required this.present,
        required this.listOfResult,
        required this.numberOfResult,
    });

    ByCountry copyWith({
        bool? present,
        List<ByCountryListOfResult>? listOfResult,
        int? numberOfResult,
    }) => 
        ByCountry(
            present: present ?? this.present,
            listOfResult: listOfResult ?? this.listOfResult,
            numberOfResult: numberOfResult ?? this.numberOfResult,
        );

    factory ByCountry.fromJson(Map<String, dynamic> json) => ByCountry(
        present: json["present"],
        listOfResult: List<ByCountryListOfResult>.from(json["listOfResult"].map((x) => ByCountryListOfResult.fromJson(x))),
        numberOfResult: json["numberOfResult"],
    );

    Map<String, dynamic> toJson() => {
        "present": present,
        "listOfResult": List<dynamic>.from(listOfResult.map((x) => x.toJson())),
        "numberOfResult": numberOfResult,
    };
}

class ByCountryListOfResult {
    String valueToDisplay;
    FluffyAddress address;
    SearchArray searchArray;

    ByCountryListOfResult({
        required this.valueToDisplay,
        required this.address,
        required this.searchArray,
    });

    ByCountryListOfResult copyWith({
        String? valueToDisplay,
        FluffyAddress? address,
        SearchArray? searchArray,
    }) => 
        ByCountryListOfResult(
            valueToDisplay: valueToDisplay ?? this.valueToDisplay,
            address: address ?? this.address,
            searchArray: searchArray ?? this.searchArray,
        );

    factory ByCountryListOfResult.fromJson(Map<String, dynamic> json) => ByCountryListOfResult(
        valueToDisplay: json["valueToDisplay"],
        address: FluffyAddress.fromJson(json["address"]),
        searchArray: SearchArray.fromJson(json["searchArray"]),
    );

    Map<String, dynamic> toJson() => {
        "valueToDisplay": valueToDisplay,
        "address": address.toJson(),
        "searchArray": searchArray.toJson(),
    };
}

class FluffyAddress {
    String country;

    FluffyAddress({
        required this.country,
    });

    FluffyAddress copyWith({
        String? country,
    }) => 
        FluffyAddress(
            country: country ?? this.country,
        );

    factory FluffyAddress.fromJson(Map<String, dynamic> json) => FluffyAddress(
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
    };
}

class ByPropertyName {
    bool present;
    List<ByPropertyNameListOfResult> listOfResult;
    int numberOfResult;

    ByPropertyName({
        required this.present,
        required this.listOfResult,
        required this.numberOfResult,
    });

    ByPropertyName copyWith({
        bool? present,
        List<ByPropertyNameListOfResult>? listOfResult,
        int? numberOfResult,
    }) => 
        ByPropertyName(
            present: present ?? this.present,
            listOfResult: listOfResult ?? this.listOfResult,
            numberOfResult: numberOfResult ?? this.numberOfResult,
        );

    factory ByPropertyName.fromJson(Map<String, dynamic> json) => ByPropertyName(
        present: json["present"],
        listOfResult: List<ByPropertyNameListOfResult>.from(json["listOfResult"].map((x) => ByPropertyNameListOfResult.fromJson(x))),
        numberOfResult: json["numberOfResult"],
    );

    Map<String, dynamic> toJson() => {
        "present": present,
        "listOfResult": List<dynamic>.from(listOfResult.map((x) => x.toJson())),
        "numberOfResult": numberOfResult,
    };
}

class ByPropertyNameListOfResult {
    String valueToDisplay;
    String propertyName;
    TentacledAddress address;
    SearchArray searchArray;

    ByPropertyNameListOfResult({
        required this.valueToDisplay,
        required this.propertyName,
        required this.address,
        required this.searchArray,
    });

    ByPropertyNameListOfResult copyWith({
        String? valueToDisplay,
        String? propertyName,
        TentacledAddress? address,
        SearchArray? searchArray,
    }) => 
        ByPropertyNameListOfResult(
            valueToDisplay: valueToDisplay ?? this.valueToDisplay,
            propertyName: propertyName ?? this.propertyName,
            address: address ?? this.address,
            searchArray: searchArray ?? this.searchArray,
        );

    factory ByPropertyNameListOfResult.fromJson(Map<String, dynamic> json) => ByPropertyNameListOfResult(
        valueToDisplay: json["valueToDisplay"],
        propertyName: json["propertyName"],
        address: TentacledAddress.fromJson(json["address"]),
        searchArray: SearchArray.fromJson(json["searchArray"]),
    );

    Map<String, dynamic> toJson() => {
        "valueToDisplay": valueToDisplay,
        "propertyName": propertyName,
        "address": address.toJson(),
        "searchArray": searchArray.toJson(),
    };
}

class TentacledAddress {
    String city;
    String state;

    TentacledAddress({
        required this.city,
        required this.state,
    });

    TentacledAddress copyWith({
        String? city,
        String? state,
    }) => 
        TentacledAddress(
            city: city ?? this.city,
            state: state ?? this.state,
        );

    factory TentacledAddress.fromJson(Map<String, dynamic> json) => TentacledAddress(
        city: json["city"],
        state: json["state"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
    };
}

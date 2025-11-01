// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

Property propertyFromJson(String str) => Property.fromJson(json.decode(str));

String propertyToJson(Property data) => json.encode(data.toJson());

class Property {
    bool status;
    String message;
    int responseCode;
    List<Datum> data;

    Property({
        required this.status,
        required this.message,
        required this.responseCode,
        required this.data,
    });


    Property copyWith({
        bool? status,
        String? message,
        int? responseCode,
        List<Datum>? data,
    }) => 
        Property(
            status: status ?? this.status,
            message: message ?? this.message,
            responseCode: responseCode ?? this.responseCode,
            data: data ?? this.data,
        );

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        status: json["status"],
        message: json["message"],
        responseCode: json["responseCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "responseCode": responseCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String propertyName;
    int propertyStar;
    String propertyImage;
    String propertyCode;
    String propertyType;
    PropertyPoliciesAndAmmenities propertyPoliciesAndAmmenities;
    Price markedPrice;
    Price staticPrice;
    GoogleReview googleReview;
    String propertyUrl;
    PropertyAddress propertyAddress;

    Datum({
        required this.propertyName,
        required this.propertyStar,
        required this.propertyImage,
        required this.propertyCode,
        required this.propertyType,
        required this.propertyPoliciesAndAmmenities,
        required this.markedPrice,
        required this.staticPrice,
        required this.googleReview,
        required this.propertyUrl,
        required this.propertyAddress,
    });

    Datum copyWith({
        String? propertyName,
        int? propertyStar,
        String? propertyImage,
        String? propertyCode,
        String? propertyType,
        PropertyPoliciesAndAmmenities? propertyPoliciesAndAmmenities,
        Price? markedPrice,
        Price? staticPrice,
        GoogleReview? googleReview,
        String? propertyUrl,
        PropertyAddress? propertyAddress,
    }) => 
        Datum(
            propertyName: propertyName ?? this.propertyName,
            propertyStar: propertyStar ?? this.propertyStar,
            propertyImage: propertyImage ?? this.propertyImage,
            propertyCode: propertyCode ?? this.propertyCode,
            propertyType: propertyType ?? this.propertyType,
            propertyPoliciesAndAmmenities: propertyPoliciesAndAmmenities ?? this.propertyPoliciesAndAmmenities,
            markedPrice: markedPrice ?? this.markedPrice,
            staticPrice: staticPrice ?? this.staticPrice,
            googleReview: googleReview ?? this.googleReview,
            propertyUrl: propertyUrl ?? this.propertyUrl,
            propertyAddress: propertyAddress ?? this.propertyAddress,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        propertyName: json["propertyName"],
        propertyStar: json["propertyStar"],
        propertyImage: json["propertyImage"],
        propertyCode: json["propertyCode"],
        propertyType: json["propertyType"],
        propertyPoliciesAndAmmenities: PropertyPoliciesAndAmmenities.fromJson(json["propertyPoliciesAndAmmenities"]),
        markedPrice: Price.fromJson(json["markedPrice"]),
        staticPrice: Price.fromJson(json["staticPrice"]),
        googleReview: GoogleReview.fromJson(json["googleReview"]),
        propertyUrl: json["propertyUrl"],
        propertyAddress: PropertyAddress.fromJson(json["propertyAddress"]),
    );

    Map<String, dynamic> toJson() => {
        "propertyName": propertyName,
        "propertyStar": propertyStar,
        "propertyImage": propertyImage,
        "propertyCode": propertyCode,
        "propertyType": propertyType,
        "propertyPoliciesAndAmmenities": propertyPoliciesAndAmmenities.toJson(),
        "markedPrice": markedPrice.toJson(),
        "staticPrice": staticPrice.toJson(),
        "googleReview": googleReview.toJson(),
        "propertyUrl": propertyUrl,
        "propertyAddress": propertyAddress.toJson(),
    };
}

class GoogleReview {
    bool reviewPresent;
    GoogleReviewData data;

    GoogleReview({
        required this.reviewPresent,
        required this.data,
    });

    GoogleReview copyWith({
        bool? reviewPresent,
        GoogleReviewData? data,
    }) => 
        GoogleReview(
            reviewPresent: reviewPresent ?? this.reviewPresent,
            data: data ?? this.data,
        );

    factory GoogleReview.fromJson(Map<String, dynamic> json) => GoogleReview(
        reviewPresent: json["reviewPresent"],
        data: GoogleReviewData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "reviewPresent": reviewPresent,
        "data": data.toJson(),
    };
}

class GoogleReviewData {
    double overallRating;
    int totalUserRating;
    int withoutDecimal;

    GoogleReviewData({
        required this.overallRating,
        required this.totalUserRating,
        required this.withoutDecimal,
    });

    GoogleReviewData copyWith({
        double? overallRating,
        int? totalUserRating,
        int? withoutDecimal,
    }) => 
        GoogleReviewData(
            overallRating: overallRating ?? this.overallRating,
            totalUserRating: totalUserRating ?? this.totalUserRating,
            withoutDecimal: withoutDecimal ?? this.withoutDecimal,
        );

    factory GoogleReviewData.fromJson(Map<String, dynamic> json) => GoogleReviewData(
        overallRating: json["overallRating"]?.toDouble(),
        totalUserRating: json["totalUserRating"],
        withoutDecimal: json["withoutDecimal"],
    );

    Map<String, dynamic> toJson() => {
        "overallRating": overallRating,
        "totalUserRating": totalUserRating,
        "withoutDecimal": withoutDecimal,
    };
}

class Price {
    double amount;
    String displayAmount;
    String currencyAmount;
    String currencySymbol;

    Price({
        required this.amount,
        required this.displayAmount,
        required this.currencyAmount,
        required this.currencySymbol,
    });

    Price copyWith({
        double? amount,
        String? displayAmount,
        String? currencyAmount,
        String? currencySymbol,
    }) => 
        Price(
            amount: amount ?? this.amount,
            displayAmount: displayAmount ?? this.displayAmount,
            currencyAmount: currencyAmount ?? this.currencyAmount,
            currencySymbol: currencySymbol ?? this.currencySymbol,
        );

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: json["amount"]?.toDouble(),
        displayAmount: json["displayAmount"],
        currencyAmount: json["currencyAmount"],
        currencySymbol: json["currencySymbol"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "displayAmount": displayAmount,
        "currencyAmount": currencyAmount,
        "currencySymbol": currencySymbol,
    };
}

class PropertyAddress {
    String street;
    String city;
    String state;
    String country;
    String zipcode;
    String mapAddress;
    double latitude;
    double longitude;

    PropertyAddress({
        required this.street,
        required this.city,
        required this.state,
        required this.country,
        required this.zipcode,
        required this.mapAddress,
        required this.latitude,
        required this.longitude,
    });

    PropertyAddress copyWith({
        String? street,
        String? city,
        String? state,
        String? country,
        String? zipcode,
        String? mapAddress,
        double? latitude,
        double? longitude,
    }) => 
        PropertyAddress(
            street: street ?? this.street,
            city: city ?? this.city,
            state: state ?? this.state,
            country: country ?? this.country,
            zipcode: zipcode ?? this.zipcode,
            mapAddress: mapAddress ?? this.mapAddress,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
        );

    factory PropertyAddress.fromJson(Map<String, dynamic> json) => PropertyAddress(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        mapAddress: json["map_address"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "map_address": mapAddress,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class PropertyPoliciesAndAmmenities {
    bool present;
    PropertyPoliciesAndAmmenitiesData data;

    PropertyPoliciesAndAmmenities({
        required this.present,
        required this.data,
    });

    PropertyPoliciesAndAmmenities copyWith({
        bool? present,
        PropertyPoliciesAndAmmenitiesData? data,
    }) => 
        PropertyPoliciesAndAmmenities(
            present: present ?? this.present,
            data: data ?? this.data,
        );

    factory PropertyPoliciesAndAmmenities.fromJson(Map<String, dynamic> json) => PropertyPoliciesAndAmmenities(
        present: json["present"],
        data: PropertyPoliciesAndAmmenitiesData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "present": present,
        "data": data.toJson(),
    };
}

class PropertyPoliciesAndAmmenitiesData {
    String cancelPolicy;
    String refundPolicy;
    String childPolicy;
    String damagePolicy;
    String propertyRestriction;
    bool petsAllowed;
    bool coupleFriendly;
    bool suitableForChildren;
    bool bachularsAllowed;
    bool freeWifi;
    bool freeCancellation;
    bool payAtHotel;
    bool payNow;
    DateTime lastUpdatedOn;

    PropertyPoliciesAndAmmenitiesData({
        required this.cancelPolicy,
        required this.refundPolicy,
        required this.childPolicy,
        required this.damagePolicy,
        required this.propertyRestriction,
        required this.petsAllowed,
        required this.coupleFriendly,
        required this.suitableForChildren,
        required this.bachularsAllowed,
        required this.freeWifi,
        required this.freeCancellation,
        required this.payAtHotel,
        required this.payNow,
        required this.lastUpdatedOn,
    });

    PropertyPoliciesAndAmmenitiesData copyWith({
        String? cancelPolicy,
        String? refundPolicy,
        String? childPolicy,
        String? damagePolicy,
        String? propertyRestriction,
        bool? petsAllowed,
        bool? coupleFriendly,
        bool? suitableForChildren,
        bool? bachularsAllowed,
        bool? freeWifi,
        bool? freeCancellation,
        bool? payAtHotel,
        bool? payNow,
        DateTime? lastUpdatedOn,
    }) => 
        PropertyPoliciesAndAmmenitiesData(
            cancelPolicy: cancelPolicy ?? this.cancelPolicy,
            refundPolicy: refundPolicy ?? this.refundPolicy,
            childPolicy: childPolicy ?? this.childPolicy,
            damagePolicy: damagePolicy ?? this.damagePolicy,
            propertyRestriction: propertyRestriction ?? this.propertyRestriction,
            petsAllowed: petsAllowed ?? this.petsAllowed,
            coupleFriendly: coupleFriendly ?? this.coupleFriendly,
            suitableForChildren: suitableForChildren ?? this.suitableForChildren,
            bachularsAllowed: bachularsAllowed ?? this.bachularsAllowed,
            freeWifi: freeWifi ?? this.freeWifi,
            freeCancellation: freeCancellation ?? this.freeCancellation,
            payAtHotel: payAtHotel ?? this.payAtHotel,
            payNow: payNow ?? this.payNow,
            lastUpdatedOn: lastUpdatedOn ?? this.lastUpdatedOn,
        );

    factory PropertyPoliciesAndAmmenitiesData.fromJson(Map<String, dynamic> json) => PropertyPoliciesAndAmmenitiesData(
        cancelPolicy: json["cancelPolicy"],
        refundPolicy: json["refundPolicy"],
        childPolicy: json["childPolicy"],
        damagePolicy: json["damagePolicy"],
        propertyRestriction: json["propertyRestriction"],
        petsAllowed: json["petsAllowed"],
        coupleFriendly: json["coupleFriendly"],
        suitableForChildren: json["suitableForChildren"],
        bachularsAllowed: json["bachularsAllowed"],
        freeWifi: json["freeWifi"],
        freeCancellation: json["freeCancellation"],
        payAtHotel: json["payAtHotel"],
        payNow: json["payNow"],
        lastUpdatedOn: DateTime.parse(json["lastUpdatedOn"]),
    );

    Map<String, dynamic> toJson() => {
        "cancelPolicy": cancelPolicy,
        "refundPolicy": refundPolicy,
        "childPolicy": childPolicy,
        "damagePolicy": damagePolicy,
        "propertyRestriction": propertyRestriction,
        "petsAllowed": petsAllowed,
        "coupleFriendly": coupleFriendly,
        "suitableForChildren": suitableForChildren,
        "bachularsAllowed": bachularsAllowed,
        "freeWifi": freeWifi,
        "freeCancellation": freeCancellation,
        "payAtHotel": payAtHotel,
        "payNow": payNow,
        "lastUpdatedOn": lastUpdatedOn.toIso8601String(),
    };
}

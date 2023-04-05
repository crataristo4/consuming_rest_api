// To parse this JSON data, do
//
//     final errorMessage = errorMessageFromJson(jsonString);

import 'dart:convert';

ErrorOrSuccessMessage errorOrSuccessMessageFromJson(String str) => ErrorOrSuccessMessage.fromJson(json.decode(str));

String errorOrSuccessMessageToJson(ErrorOrSuccessMessage data) => json.encode(data.toJson());

class ErrorOrSuccessMessage {
  ErrorOrSuccessMessage({required this.message});

  final String message;

  factory ErrorOrSuccessMessage.fromJson(Map<String, dynamic> json) => ErrorOrSuccessMessage(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {"message": message};
}

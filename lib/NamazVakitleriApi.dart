// To parse this JSON data, do
//
//     final namazVakitleri = namazVakitleriFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class NamazVakitleri {
  NamazVakitleri({
    required this.success,
    required this.result,
  });

  bool success;
  List<Result> result;

  factory NamazVakitleri.fromRawJson(String str) =>
      NamazVakitleri.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NamazVakitleri.fromJson(Map<String, dynamic> json) => NamazVakitleri(
        success: json["success"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.saat,
    required this.vakit,
  });

  String saat;
  String vakit;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        saat: json["saat"],
        vakit: json["vakit"],
      );

  Map<String, dynamic> toJson() => {
        "saat": saat,
        "vakit": vakit,
      };
}

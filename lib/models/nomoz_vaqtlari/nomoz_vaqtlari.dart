// To parse this JSON data, do
//
//     final modelPrayingTimes = modelPrayingTimesFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'nomoz_vaqtlari.g.dart';

List<ModelPrayingTimes> modelPrayingTimesFromJson(String str) =>
    List<ModelPrayingTimes>.from(
        json.decode(str).map((x) => ModelPrayingTimes.fromJson(x)));

String modelPrayingTimesToJson(List<ModelPrayingTimes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 0)
class ModelPrayingTimes {
  ModelPrayingTimes({
    this.month,
    this.day,
    this.times,
    this.region,
    this.date,
    this.weekday,
  });
  @HiveField(0)
  int? month;
  @HiveField(1)
  int? day;
  @HiveField(2)
  Times? times;
  @HiveField(3)
  String? region;
  @HiveField(4)
  DateTime? date;
  @HiveField(5)
  String? weekday;

  factory ModelPrayingTimes.fromJson(Map<String, dynamic> json) =>
      ModelPrayingTimes(
        month: json["month"],
        day: json["day"],
        times: Times.fromJson(json["times"]),
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "day": day,
        "times": times!.toJson(),
        "region": region,
        "date": date!.toIso8601String(),
        "weekday": weekday == null ? null : weekday,
      };
}

@HiveType(typeId: 1)
class Times {
  Times({
    this.tongSaharlik,
    this.quyosh,
    this.peshin,
    this.asr,
    this.shomIftor,
    this.hufton,
  });

  @HiveField(0)
  String? tongSaharlik;
  @HiveField(1)
  String? quyosh;
  @HiveField(2)
  String? peshin;
  @HiveField(3)
  String? asr;
  @HiveField(4)
  String? shomIftor;
  @HiveField(5)
  String? hufton;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        tongSaharlik: json["tong_saharlik"],
        quyosh: json["quyosh"],
        peshin: json["peshin"],
        asr: json["asr"],
        shomIftor: json["shom_iftor"],
        hufton: json["hufton"],
      );

  Map<String, dynamic> toJson() => {
        "tong_saharlik": tongSaharlik,
        "quyosh": quyosh,
        "peshin": peshin,
        "asr": asr,
        "shom_iftor": shomIftor,
        "hufton": hufton,
      };
}

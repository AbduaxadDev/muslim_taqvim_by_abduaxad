// To parse this JSON data, do
//
//     final ollohIsmlariModel = ollohIsmlariModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'ismlar.g.dart';

List<OllohIsmlariModel> ollohIsmlariModelFromJson(String str) =>
    List<OllohIsmlariModel>.from(
        json.decode(str).map((x) => OllohIsmlariModel.fromJson(x)));

String ollohIsmlariModelToJson(List<OllohIsmlariModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: 6)
class OllohIsmlariModel {
  OllohIsmlariModel({
    this.id,
    this.arName,
    this.enName,
    this.meaning,
    this.explanation,
    this.benefit,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? arName;
  @HiveField(2)
  String? enName;
  @HiveField(3)
  String? meaning;
  @HiveField(4)
  String? explanation;
  @HiveField(5)
  String? benefit;

  factory OllohIsmlariModel.fromJson(Map<String, dynamic> json) =>
      OllohIsmlariModel(
        id: json["id"],
        arName: json["arName"],
        enName: json["enName"],
        meaning: json["meaning"],
        explanation: json["explanation"],
        benefit: json["benefit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arName": arName,
        "enName": enName,
        "meaning": meaning,
        "explanation": explanation,
        "benefit": benefit,
      };
}

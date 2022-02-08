// To parse this JSON data, do
//
//     final QuranInArabianModel = QuranInArabianModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'quran.g.dart';

List<QuranInArabianModel> QuranInArabianModelFromJson(String str) =>
    List<QuranInArabianModel>.from(
        json.decode(str).map((x) => QuranInArabianModel.fromJson(x)));

@HiveType(typeId: 4)
class QuranInArabianModel {
  QuranInArabianModel({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? englishName;
  @HiveField(3)
  String? englishNameTranslation;
  @HiveField(4)
  String? revelationType;
  @HiveField(5)
  List<Oyat>? ayahs;

  factory QuranInArabianModel.fromJson(Map<String, dynamic> json) =>
      QuranInArabianModel(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        ayahs: List<Oyat>.from(json["ayahs"]
            .map((x) => Oyat.fromJson(Map<String, dynamic>.from(x)))),
      );
}

@HiveType(typeId: 5)
class Oyat {
  Oyat({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? text;
  @HiveField(2)
  int? numberInSurah;
  @HiveField(3)
  int? juz;
  @HiveField(4)
  int? manzil;
  @HiveField(5)
  int? page;
  @HiveField(6)
  int? ruku;
  @HiveField(7)
  int? hizbQuarter;
  @HiveField(8)
  String? sajda;

  factory Oyat.fromJson(Map<String, dynamic> json) => Oyat(
        number: json["number"],
        text: json["text"],
        numberInSurah: json["numberInSurah"],
        juz: json["juz"],
        manzil: json["manzil"],
        page: json["page"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: json["sajda"].toString(),
      );
}

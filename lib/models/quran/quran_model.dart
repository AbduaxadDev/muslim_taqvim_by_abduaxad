// To parse this JSON data, do
//
//     final quranArabianModel = quranArabianModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'quran_model.g.dart';

List<QuranArabianModel> quranArabianModelFromJson(String str) =>
    List<QuranArabianModel>.from(
        json.decode(str).map((x) => QuranArabianModel.fromJson(x)));

@HiveType(typeId: 2)
class QuranArabianModel {
  QuranArabianModel({
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
  List<Ayah>? ayahs;

  factory QuranArabianModel.fromJson(Map<String, dynamic> json) =>
      QuranArabianModel(
        number: json["number"],
        name: json["name"],
        englishName: json["englishName"],
        englishNameTranslation: json["englishNameTranslation"],
        revelationType: json["revelationType"],
        ayahs: List<Ayah>.from(json["ayahs"]
            .map((x) => Ayah.fromJson(Map<String, dynamic>.from(x)))),
      );
}

@HiveType(typeId: 3)
class Ayah {
  Ayah({
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

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
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

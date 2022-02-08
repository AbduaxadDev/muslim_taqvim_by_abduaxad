class MuborakKunlar {
  String nomi;
  String sanasi;
  String haqida;
  MuborakKunlar({
    required this.nomi,
    required this.sanasi,
    required this.haqida,
  });
}

List kunlar = [
  '02.02.2022',
  '03.02.2022',
  '27.02.2022',
  '17.03.2022',
  '02.04.2022',
  '27.04.2022',
  '01.05.2022',
  '02.05.2022',
  '03.05.2022',
  '04.05.2022',
  '08.07.2022',
  '09.07.2022',
  '10.07.2022',
  '11.07.2022',
  '12.07.2022',
  '30.07.2022',
  '08.08.2022',
  '07.10.2022',
];
List nomlari = [
  'Muborak uch oyning boshlanishi',
  'Rag\'oyib kechasi',
  'Isro va Me\'roj kechasi',
  'Baroat kechasi',
  'Ramazon oyining birinchi kechasi',
  'Qadr kechasi',
  'Arafa',
  'Ramazon Hayiti 1-kun',
  'Ramazon Hayiti 2-kun',
  'Ramazon Hayiti 3-kun',
  'Arafa',
  'Qurbon Hayiti 1-kun',
  'Qurbon Hayiti 2-kun',
  'Qurbon Hayiti 3-kun',
  'Qurbon Hayiti 4-kun',
  'Xijriy yangi yil',
  'Ashuro kuni',
  'Mavludi sharif kuni',
];

List<MuborakKunlar> diniyKunalar = List.generate(
    nomlari.length,
    (index) => MuborakKunlar(
          nomi: nomlari[index],
          sanasi: kunlar[index],
          haqida:
              'Ushbu sanaga oid hadis yoki sunnat amallar tafsifi keltiriladi. Ayni vaqtda ma\' ma\'lumotlar yetarli emas!',
        ));

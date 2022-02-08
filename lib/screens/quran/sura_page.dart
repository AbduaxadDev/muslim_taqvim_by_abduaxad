import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class SuraPage extends StatelessWidget {
  SuraPage({
    Key? key,
    required this.sura,
    required this.suraInArabian,
  }) : super(key: key);

  QuranArabianModel sura;
  QuranInArabianModel suraInArabian;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1F3F6),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xffE1F3F6),
            floating: true,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(
                  getWidth(20), getHeight(80), getWidth(20), 0),
              child: ContainerDecoration(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.transparent,
                      child: Stack(
                        children: [
                          Center(child: Image.asset(ConstantLinks.frame)),
                          Center(
                            child: Text(
                              sura.number.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      sura.name.toString(),
                      style:
                          TextStyle(fontSize: ConstantSizes.header_second_size),
                    ),
                    Text(
                      sura.englishName.toString(),
                      style:
                          TextStyle(fontSize: ConstantSizes.header_third_size),
                    ),
                  ],
                ),
                height: 200,
                width: 400,
              ),
            ),
            expandedHeight: 60,
            collapsedHeight: getHeight(270),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              child: Text(
                                sura.ayahs![index].numberInSurah.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.play_arrow_outlined,
                                    size: 30,
                                    color: Color(0xff80D3CE),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.share,
                                      color: Color(0xff80D3CE),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.bookmark_add_outlined,
                                    color: Color(0xff80D3CE),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        width: double.infinity,
                        child: AutoSizeText(
                          suraInArabian.ayahs![index].text.toString(),
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: ConstantSizes.quran_in_arabian_size,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        width: double.infinity,
                        child: AutoSizeText(
                          sura.ayahs![index].text.toString(),
                          style: TextStyle(
                            fontSize: ConstantSizes.header_third_size,
                          ),
                        ),
                      ),
                      Divider(
                        color: ConstantColors.divider_color,
                      ),
                    ],
                  ),
                );
              },
              childCount: sura.ayahs!.length,
            ),
          ),
        ],
      ),
    );
  }
}

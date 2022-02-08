import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  Box? boxQuran;
  Box? boxQuranInArabian;

  @override
  void initState() {
    boxQuran = Boxes.getQuran();
    boxQuranInArabian = Boxes.getQuranInArabian();
    (boxQuran!.isEmpty || boxQuranInArabian!.isEmpty) ? reloadQuran() : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quran Kareem"),
        titleTextStyle: TextStyle(
            fontSize: ConstantSizes.app_bar_size, color: Colors.black),
        centerTitle: true,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false),
          icon: const Icon(Icons.home_outlined),
          iconSize: 30,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: const SearchField(),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: boxQuran!.values.length,
                separatorBuilder: (context, index) => Divider(
                  color: ConstantColors.divider_color,
                ),
                itemBuilder: (context, index) {
                  QuranArabianModel sura = boxQuran!.values.toList()[index];
                  QuranInArabianModel suraInAranian =
                      boxQuranInArabian!.values.toList()[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(context, "/sura",
                        arguments: [sura, suraInAranian]),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        child: Stack(
                          children: [
                            Center(child: Image.asset(ConstantLinks.frame,)),//
                            Center(
                              child: Text(
                                sura.number.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Text(sura.englishName.toString()),
                      subtitle: Text(sura.revelationType.toString()),
                      trailing: Text(sura.name.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  reloadQuran() async {
    List<QuranArabianModel> quran = [];
    List<QuranInArabianModel> quranInArabian = [];

    await ServiceQuran.getQuran().then((value) => quran = value);
    await ServiceQuran.getQuranInArabian()
        .then((value) => quranInArabian = value);

    for (var i = 0; i < quran.length; i++) {
      await boxQuran!.add(quran[i]);
      await boxQuranInArabian!.add(quranInArabian[i]);
    }
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Search",
        suffixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

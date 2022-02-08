import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class IsmlarPage extends StatefulWidget {
  const IsmlarPage({Key? key}) : super(key: key);

  @override
  _IsmlarPageState createState() => _IsmlarPageState();
}

class _IsmlarPageState extends State<IsmlarPage> {
  Box<OllohIsmlariModel>? ismlarBox;
  List<OllohIsmlariModel> ismlarListi = [];
  @override
  void initState() {
    ismlarBox = Boxes.getNames();
    ismlarBox!.isEmpty ? getFromInternet() : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: getHeight(80),
        title: SizedBox(
          width: getWidth(260),
          height: getHeight(60),
          child: Text(
            "Ollohning 99 go'zal ismlari",
            style: TextStyle(fontSize: ConstantSizes.app_bar_size),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: getHeight(600),
          ),
          itemCount: ismlarBox!.values.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            List<OllohIsmlariModel> ismlar = ismlarBox!.values.toList();
            return FlashCard(
              height: double.infinity,
              width: double.infinity,
              frontWidget: ContainerDecoration(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardAboutPart(
                      text: ismlar[itemIndex].explanation.toString(),
                      textSize: 20,
                      aboutPart: "Tavsifi",
                    ),
                    Divider(
                      color: ConstantColors.divider_color,
                    ),
                    CardAboutPart(
                      text: ismlar[itemIndex].benefit.toString(),
                      textSize: 20,
                      aboutPart: "Zikrdan foydalar",
                    ),
                  ],
                ),
                height: double.infinity,
                width: double.infinity,
              ),
              backWidget: ContainerDecoration(
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              ismlar[itemIndex].arName.toString(),
                              style: TextStyle(fontSize: getHeight(55)),
                            ),
                          ),
                          Positioned(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Stack(
                                children: [
                                  Center(
                                      child: Image.asset(ConstantLinks.frame)),
                                  Center(
                                    child: Text(
                                      ismlar[itemIndex].id.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: ConstantColors.divider_color,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          ismlar[itemIndex].enName.toString(),
                          style: TextStyle(fontSize: getHeight(35)),
                        ),
                      ),
                    ),
                    Divider(
                      color: ConstantColors.divider_color,
                    ),
                    CardAboutPart(
                      text: ismlar[itemIndex].meaning.toString(),
                      textSize: 30,
                      aboutPart: "Ma'nosi",
                    ),
                  ],
                ),
                height: double.infinity,
                width: double.infinity,
              ),
            );
          },
        ),
      ),
    );
  }

  getFromInternet() async {
    List<OllohIsmlariModel> ismlar = [];
    await ServiceOllohIsmlari.getNames().then((value) => ismlar = value);
    for (var element in ismlar) {
      await ismlarBox!.add(element);
    }
  }
}
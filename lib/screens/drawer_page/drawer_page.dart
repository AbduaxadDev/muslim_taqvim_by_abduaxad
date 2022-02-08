import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/nomoz_vaqtlari"),
                child: ContainerDecoration(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          "Nomoz vaqtlari(taqvim)",
                          style: TextStyle(
                              fontSize: ConstantSizes.header_third_size,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                  height: getHeight(80),
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: getHeight(15),
              ),
              ContainerDecoration(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        "Kundalik Zikrlar to'plami",
                        style: TextStyle(
                            fontSize: ConstantSizes.header_third_size,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined),
                  ],
                ),
                height: getHeight(80),
                width: double.infinity,
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/quran"),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(60),
                              width: getHeight(60),
                              child: Image.asset(ConstantLinks.quran),
                            ),
                            Text(
                              "Quran",
                              style: TextStyle(
                                  fontSize: ConstantSizes.header_third_size,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/tasbeh"),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(60),
                              width: getHeight(60),
                              child: Image.asset(ConstantLinks.tasbeh),
                            ),
                            Text(
                              "Tasbeh",
                              style: TextStyle(
                                  fontSize: ConstantSizes.header_third_size,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, "/muborak_kunlar"),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(50),
                              width: getHeight(60),
                              child: Image.asset(ConstantLinks.muborak_days),
                            ),
                            SizedBox(
                              height: getHeight(30),
                              width: getHeight(80),
                              child: AutoSizeText(
                                "Muborak Kunlar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ConstantSizes.header_third_size,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/ismlar"),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(50),
                              width: getHeight(60),
                              child: Text(
                                "99",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ConstantSizes.header_second_size,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: getHeight(30),
                              width: getHeight(80),
                              child: AutoSizeText(
                                "Ollohning ismlari",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ConstantSizes.header_third_size,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, "/qibla"),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(50),
                              width: getHeight(60),
                              child: Image.asset(ConstantLinks.qibla),
                            ),
                            SizedBox(
                              height: getHeight(30),
                              width: getHeight(80),
                              child: AutoSizeText(
                                "Qibla",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ConstantSizes.header_third_size,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContdownTime(),
                      ),
                    ),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(50),
                              width: getHeight(60),
                              child: Image.asset(ConstantLinks.masjid),
                            ),
                            SizedBox(
                              height: getHeight(30),
                              width: getHeight(80),
                              child: AutoSizeText(
                                "Masjidlar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ConstantSizes.header_third_size,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => showSearch(
                        context: context, delegate: LocationSearchPage()),
                    child: ContainerDecoration(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: getHeight(50),
                              width: getHeight(60),
                              child: const Icon(
                                Icons.location_on_outlined,
                                size: 50,
                              ),
                            ),
                            SizedBox(
                              height: getHeight(30),
                              width: getHeight(80),
                              child: AutoSizeText(
                                "Location",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ConstantSizes.header_third_size,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        height: 120,
                        width: 120),
                  ),
                  ContainerDecoration(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: getHeight(50),
                            width: getHeight(60),
                            child: const Icon(
                              Icons.email,
                              size: 50,
                            ),
                          ),
                          SizedBox(
                            height: getHeight(30),
                            width: getHeight(80),
                            child: AutoSizeText(
                              "Contact me",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: ConstantSizes.header_third_size,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      height: 120,
                      width: 120),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

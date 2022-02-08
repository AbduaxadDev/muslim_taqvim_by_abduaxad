import 'package:muslim_taqvim_by_abduaxad/utilits/package.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({Key? key}) : super(key: key);

  @override
  _TasbehState createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  String _text = "Subhan' Allah";
  int _count = 0;
  bool _theme =true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tasbeh",
          style: TextStyle(fontSize: ConstantSizes.app_bar_size),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 35,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_sharp,
                size: 35,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_theme ? "assets/images/image_light.jpeg" : "assets/images/image_dark.jpg"),
            fit: BoxFit.cover
            )
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    _text,
                    style: TextStyle(
                      color: color(),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$_count",
                    style: TextStyle(
                      color: color(),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_count >= 99) {
                  _count = 0;
                } else {
                  _count += 1;
                }
                zikrlar();
              },
              child: Icon(
                Icons.fingerprint,
                color: color(),
                size: 100,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shape: CircleBorder(),
                fixedSize: Size(120, 120),
                elevation: 0,
                shadowColor: Colors.transparent,
                onPrimary: Colors.transparent,
                onSurface: Colors.transparent,
                
                
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          Spacer(flex: 2,),
          FloatingActionButton(
            highlightElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: (){
              _count =0;
              zikrlar();
            },
            child: Icon(Icons.refresh,
            color: color(),
            size: 35,
            ),
          ),
          Spacer(flex: 7,),
          FloatingActionButton(
            highlightElevation: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: (){
              _theme = !_theme;
              setState(() {});
            },
            child: Icon(
              _theme ? Icons.light_mode : Icons.dark_mode,
              color: color(),
              size: 35,
            ),
          ),
          Spacer(flex: 1,)
        ],
      ),
    );
  }

  zikrlar() {
    if (_count >= 0 && _count < 33) {
      _text = "Subhan' Allah";
    } else if (_count >= 34 && _count < 66) {
      _text = "Alhamdulillah";
    } else if (_count >= 67 && _count < 99) {
      _text = "Allah hu akbar";
    }
    setState(() {});
  }

 Color color(){
    if(_theme){
     return Colors.black;
    }else{
      return Colors.white;
    }
  }
}